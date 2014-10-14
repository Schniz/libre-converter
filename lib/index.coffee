express = require("express")
app = express()
shell = require("shelljs/shell")
validUrl = require("valid-url")
fs = require("fs")
checksum = require("checksum")
baseDir = shell.tempdir() + "/converts"
parseUrl = require("url").parse
basename = require("path").basename

Downloader = require("./downloader.coffee")
Converter = require("./converter.coffee")

app.get "/convert", (req, res, goNext) ->
	return goNext() if not req.query.url or not validUrl.isUri(req.query.url.replace(RegExp(" ", "g"), "%20"))

	Downloader.download(req.query.url).then (path, next) ->
		return next(null, path) if fs.existsSync(path + ".pdf")
		
		Converter.toPdf(path).then (pdfPath, pdfNext) ->
			next null, path

	.then (filePath, next) ->
		fsum = basename(filePath)
		res.redirect "/#{fsum}.pdf"
		fs.unlink filePath, next

app.get "/:checksum.pdf", (req, res, goNext) ->
	path = "#{baseDir}/#{req.params.checksum}.pdf"
	return goNext() if not req.params.checksum.match(/[a-z0-9]+/) or not fs.existsSync(path)
	res.sendFile path

app.listen 6661
