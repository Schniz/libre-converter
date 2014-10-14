shell = require('shelljs/shell')

class Shell
	constructor: ->
		@isVerbose = false

	exec: (cmd, cb) ->
		shell.exec cmd, { silent: !@isVerbose, async: true }, cb
	
sh = new Shell()
exec = sh.exec.bind(sh)
exec.sh = sh

module.exports = exec
