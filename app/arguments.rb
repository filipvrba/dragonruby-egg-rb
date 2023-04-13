module Dre
  @options = {
    root_path: nil
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
    parser.on( "-sr PATH", "--set-root PATH",
        "This command sets the root\n" +
        "path to DragonRuby.\n" +
        "(Default: '#{@configuration.parse(:root_path)}')"
      ) do |path|
      @options[:root_path] = path
    end
  end
end