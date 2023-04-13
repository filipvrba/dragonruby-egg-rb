module Dre
  @options = {
  }

  OptionParser.parse do |parser|
    parser.banner(
      "#{DragonrubyEgg::Constants::APP_FULL_NAME} is a tool for managing DragonRuby.\n" +
      "Usage: #{APP_NAME} [options]\n" +
      "\nOptions:"
    )
    parser.on( "-h", "--help", "Show help" ) do
      puts parser
      exit
    end
    parser.on( "-v", "--version", "Show version" ) do
      DragonrubyEgg::Event.print('VERSION', DragonrubyEgg::VERSION)
      exit
    end
  end
end