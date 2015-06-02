require 'socket'

server = TCPServer.new(2000)

# MOTD stands for "message of the day."  The MOTD server waits for a client
# to connect and then sends the contents of motd.txt to them.

loop do
  puts "Waiting for connection at port #{server.addr[1]}"
  client = server.accept
  client.puts File.read('motd.txt')
  client.close
end
