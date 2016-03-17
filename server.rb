require "mini-smtp-server"
require "json"
require "pry"
require "httparty"

class SMTPServer < MiniSmtpServer
  LISTEN_PORT = 1025
  LISTEN_IP = "127.0.0.1"

  def new_message_event(message_hash)
    puts "posting"
    body = {
      "email" => {
        "email" => {
          "data" => message_hash[:data],
          "sender_email" => message_hash[:from],
          "receiver_email" => message_hash[:to]
        }
      }
    }
    HTTParty.post "http://localhost:4000/api/emails", body: body
    puts "posted"
  end
end

server = SMTPServer.new(LISTEN_PORT, LISTEN_IP, 4)
server.start
server.join
