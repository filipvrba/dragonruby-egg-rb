Signal.trap("INT") do
  puts
  DragonrubyEgg::Event.print('SIGINT', 'exiting')
  exit
end