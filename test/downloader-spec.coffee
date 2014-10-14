Downloader = require('../src/downloader')

fs = require('fs')
request = require('request')
expect = require('chai').expect

describe "Downloader", ->
	it "should download a simple text file", (done)->
		@timeout 3000
		Downloader.download "https://gist.githubusercontent.com/Schniz/323c02829b1b338d380e/raw/376104b9678c72d3d1cb6d98f595506c571a1751/simpleMarkdown.md"
		.then (path, next) -> fs.readFile(path, 'utf8', next)
		.then (text, next) ->
			request "https://gist.githubusercontent.com/Schniz/323c02829b1b338d380e/raw/376104b9678c72d3d1cb6d98f595506c571a1751/simpleMarkdown.md", (_, __, body) ->
				expect(text).to.equal(body)
				done()
