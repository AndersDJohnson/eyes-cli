###
* A custom error. Doesn't do much.
###
class CustomError extends Error
	constructor: (msg) ->
		err = new Error();
		@name = 'MyError';
		@message = msg || err.message

module.exports = CustomError
