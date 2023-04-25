require_relative "lib/dragonruby_egg/constants"

EXECUTABLE = "dre"

Gem::Specification.new do |s|
  s.name        = DragonrubyEgg::Constants::APP_FULL_NAME.downcase
  s.version     = DragonrubyEgg::VERSION
  s.licenses    = ['MIT']
  s.summary     = "DragonRuby-Egg is a tool for managing DragonRuby."
  s.description = "With the tool, you can create new projects, " +
                  "install modules into a game project and open " +
                  "documentation using a command. There are many " +
                  "more functions and they are started with " +
                  "the 'dre' command."
  s.authors     = ["Filip Vrba"]
  s.email       = 'filipvrbaxi@gmail.com'
  s.files       = Dir.glob(["bin/#{EXECUTABLE}", 'app/**/*.rb', 'lib/**/*.rb'])
  s.homepage    = DragonrubyEgg::Constants::DRE_URL
  s.metadata    = { "source_code_uri" => "https://github.com/filipvrba/dragonruby-egg-rb" }
  s.bindir      = 'bin'
  s.executables << EXECUTABLE

  s.add_dependency "rest-client", "~> 2.1.0"
end