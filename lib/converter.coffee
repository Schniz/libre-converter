exec = require('./util/shellexec')
shell = require('shelljs/shell')
Neder = require("neder")

class Converter
	constructor: (opts = {}) ->
		@baseDir = opts.baseDir || shell.tempdir() + "/converts"

	toPdf: (path) ->
		Neder.amen (next) =>
			cmd = "soffice --headless --convert-to pdf --outdir #{@baseDir}/ #{path}"
			console.log cmd
			exec cmd, (error, data) -> 
				next(error, path)

converter = new Converter()
converter.Converter = Converter
module.exports = converter
