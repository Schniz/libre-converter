shell = require("shelljs/shell")
uuid = require("node-uuid").v4
parseUrl = require('url').parse
Neder = require("neder")
exec = require('./util/shellexec')
checksum = require('checksum')

class Downloader
	constructor: (opts = {}) ->
		@baseDir = opts.baseDir || shell.tempdir() + "/converts"

	download: (url) ->
		Neder.amen (next) =>
			parsedUrl = parseUrl(url)
			fileName = uuid()
			path = "#{@baseDir}/#{fileName}"
			exec "wget #{parsedUrl.href} -O #{path}", (error, data) -> next(error, path)
		.then (filePath, next) ->
			checksum.file filePath, (err, checksumFile) ->
				next(null, { checksumFile: checksumFile, filePath: filePath })
		.then (data, next) =>
			{ checksumFile, filePath } = data
			checksumPath = "#{@baseDir}/#{checksumFile}"
			exec "mv #{filePath} #{checksumPath}", (error, data) -> next(error, checksumPath)

downloader = new Downloader()
downloader.Downloader = Downloader

module.exports = downloader
