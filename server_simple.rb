require 'webrick'

## Set the path to serve files from to the public directory in this project
root = File.expand_path '~/ruby_view_server/public'

## Server Log destination
log_file = File.open '/var/log/webrick.log', 'a+'
log = WEBrick::Log.new log_file

## Access Log
access_log = [
[log_file, WEBrick::AccessLog::COMBINED_LOG_FORMAT],
]

# Create a new server on port 8000
server = WEBrick::HTTPServer.new(
:BindAddress => '0.0.0.0',
:Port => 8010,
:DocumentRoot => root, 
:Logger => log,
:Access_log => access_log
)
## Capture control+c to shut down the server
trap 'INT' do server.shutdown end

    server.mount_proc '/' do |req, res|
      res.body = 'Hello, world!'
    end
## Start the server
server.start
