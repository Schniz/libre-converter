program = require("commander")
pkg = require("../package.json")

program
	.version(pkg.version)
	.option('-v, --verbose')
	.option('-H, --hostname <hostname>', 'Hostname to listen [localhost]', 'localhost')
	.option("-P, --port <port>", "Port to listen [6661]", 6661).parse process.argv

require('./util/shellexec').sh.isVerbose = program.verbose
require('./server').listen program.port, program.hostname, ->
	"Server is listening on #{program.hostname}:#{program.port}"
