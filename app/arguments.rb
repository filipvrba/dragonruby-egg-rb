module Dre
  @options = {
    is_docs: false,
    root_path: nil,
    path: nil,
    install: nil
  }
  @options[:path] = OptionParser.last_arg if Dir.exist?(OptionParser.last_arg)

  OptionParser.parse do |parser|
    parser.banner(
      "#{DragonrubyEgg::Constants::APP_FULL_NAME} is a tool for managing DragonRuby.\n" +
      "Usage: #{APP_NAME} [options] [path]\n" +
      "\nOptions:"
    )
    parser.on( "install MODULE", "", "Installs the module in the working folder.\n" +
               "(Example: install dr-core-rb,\n" +
               "install filipvrba.dr-core-rb)\n" ) do |repo_module|
      @options[:install] = repo_module
    end
    parser.on( "-d", "--docs", "Opens the documentation for DragonRuby\n" +
                               "in the main browser." ) do
      @options[:is_docs] = true
    end
    parser.on( "-sr PATH", "--set-root PATH",
        "This command sets the root\n" +
        "path to DragonRuby.\n" +
        "(Default: '#{@configuration.parse(:root_path)}')"
      ) do |path|
      @options[:root_path] = path
    end
    parser.on( "-h", "--help", "Show help" ) do
      puts parser
      exit
    end
    parser.on( "-v", "--version", "Show version" ) do
      DragonrubyEgg::Event.print('VERSION', DragonrubyEgg::VERSION)
      exit
    end
  end

  def self.options_empty?
    @options.each do |k, v|
      if k != :path and v
        return false
      end
    end
    return true
  end
end