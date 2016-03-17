require "mini-smtp-server"
require "json"
require "pry"

class SMTPServer < MiniSmtpServer
  def new_message_event(message_hash)
    json = JSON.generate message_hash
    puts json
    # POST to HTTP server
  end
end

server = SMTPServer.new(1025, "127.0.0.1", 4)
server.start
server.join
