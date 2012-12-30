stream = require('stream')
colors = require('colors')

###
* A custom stream. Doesn't do much.
###
class OutputStream extends stream.Stream
	constructor: (options = {}) ->
		@writable = true
		@options = options
	
	
	write: (chunk, encoding) ->
		unless @options.color
			chunk = chunk.stripColors
		@emit 'data', chunk
	
	
	puts: (chunk, encoding) ->
		@write chunk + '\n', encoding
	
	
	end: (chunk) ->
		if chunk?
			@emit 'data', chunk
		@emit 'end'


module.exports = OutputStream
