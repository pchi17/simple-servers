require 'socket'

server = TCPServer.new(2000)

# See the "hot_or_cold" kata from Week 1.
# This is a server version of that kata.

loop do
  # This returns a random number between 0 and 9999.
  number_to_guess = rand(10)
  puts "Waiting for connection at port #{server.addr[1]}"
  # Wait for a client to connect
  client = server.accept
  client.puts 'CONNECTED'
  # Once a client has connected, they will stay connected until they disconnect
  # themselves or guess the correct number
  #
  # Using client.gets, read in the users guesses one guess at a time.
  # If the guess is too high,
  #    send "too hot" back to the client and wait for next guess
  # If the guess is too low,
  #    send "too cold" back to the client and wait for next guess
  # If the guess is correct,
  #   send "juuuuust right" back to the client and close the connection
  loop do
    input = client.gets.to_i
    if input > number_to_guess
      client.puts 'too hot'
    elsif input < number_to_guess
      client.puts 'too cold'
    else
      client.puts 'juuuuust right'
      break
    end
  end
  client.close
end

# Note #1
# Make sure to convert the users guesses into an integer using .to_i
# See the hot_or_cold kata from Week 1 for an example.
