fs = require 'fs'
util = require('util')
_ = require 'underscore'
eyes = require 'eyes'

OutputStream = require './OutputStream'

###
* Gets input, parses as JSON, and writes output to its stream.
###
class Main
	
	constructor: (options = {}) ->
		@options = _.defaults({}, options, {
			color: true
		}, eyes.defaults)
		
		_.defaults(@options.styles, eyes.defaults.styles)
		
		@outputStream = new OutputStream({
			color: @options.color
		})
		
		@outputFn = @getOutputFn()
		return
	
	
	getOutputFn: ->
		return eyes.inspector {
			styles: @options.styles
			maxLength: @options.maxLength
			pretty: @options.pretty
			hideFunctions: @options.hideFunctions
			stream: @outputStream
		}
	
	
	parse: (json) ->
		return JSON.parse(json)
	
	###
	* Accept input from a list of filenames.
	* Read, parse, and output each in sequence.
	###
	forFiles: (filenames) ->
		self = @
		filenames.forEach((filename) ->
			buffer = fs.readFileSync(filename)
			string = buffer.toString()
			object = self.parse(string)
			self.outputFn(object)
		)
		return
	
	###
	* Accept input from a stream, then parse and output.
	###
	fromStream: (stream) ->
		self = @
		capture = ''
		
		stream.on 'data', (chunk) ->
			capture += chunk
	
		stream.on 'end', ->
			object = self.parse(capture)
			self.outputFn(object)
		return
	
	
	###
	* Called for the command-line.
	###
	command: (args) ->
		@outputStream.pipe(process.stdout)
		
		if args.length > 0
			@forFiles(args)
		else
			process.stdin.resume()
			@fromStream(process.stdin)
		return


module.exports = Main


