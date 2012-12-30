Main = require './Main'
CustomError = require './CustomError'

util = require('util')
colors = require('colors')
pkginfo = require('pkginfo')
program = require('commander')

# color settings
colors.setTheme {
	error: 'red'
}

# for conditional color output
Object.defineProperty String::, 'maybe', {
	get: ->
		return if options?.color then @ else @stripColors
}

###
* 
###
run = ->
	try
		pkginfo(module)
	catch err
		util.puts("ERROR: Parsing eyes-cli/package.json".error.maybe)
		throw err
	
	program
		.version(module.exports.version)
		.usage('[options] <file ...>')
		.option('--no-pretty', 'no pretty formatting')
		.option('--no-color', 'no color')
		.option('-m, --max-length <n>', "max length", parseInt)
	
	program.parse(process.argv)
	
	action()
	return

###
* 
###
action = ->
	options = {}
	options.color = program.color
	options.pretty = program.pretty
	if program.maxLength?
		options.maxLength = program.maxLength
	try
		main = new Main(options)
		main.command(program.args)

	catch err
		switch true
			when err instanceof CustomError
				util.puts("ERROR: #{err.message}".error.maybe)
				program.outputHelp()
				process.exit(1)
			when err instanceof SyntaxError
				util.puts("ERROR: Invalid JSON".error.maybe)
				throw err
			else
				throw err
	
	return


exports.run = run
