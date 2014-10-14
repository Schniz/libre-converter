shell = require('shelljs/shell')

module.exports = exec = (cmd, cb) ->	shell.exec cmd, { silent: true, async: true }, cb
