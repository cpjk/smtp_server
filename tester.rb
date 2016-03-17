require 'net/smtp'

Net::SMTP.start('127.0.0.1', 1025) do |smtp|
  smtp.send_message "derp", "cpjk@derp.com", "otherdude@somwhereelse.com"
end
