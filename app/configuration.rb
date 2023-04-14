module Dre
  module_function

  @configuration = JsonParser.new File.join(ROOT, 'config/default.json')
  h_root_path = lambda { |_| @configuration.parse(:root_path) }
  DragonrubyEgg::Event.add(:root_path, h_root_path)

  def configuration_on
    @configuration.on_handler(:root_path,
      lambda do
        r_path = DragonrubyEgg::Executable.find_root_path
        unless r_path
          DragonrubyEgg::Event.print('ROOT-PATH',
            "No DragonRuby root path has been found."
          )
          DragonrubyEgg::Event.print('WARNING',
            "Please set the root path using the -sr " +
            "or --set-root argument."
          )
        end
        return r_path
      end
    ) do |is_end, r_path|
      unless is_end
        DragonrubyEgg::Event.print('ROOT-PATH',
          "The root path has not been set and so the analysis " +
          "of the root path is performed."
        )
      else
        DragonrubyEgg::Event.print('SET', "root_path: #{r_path}")
      end
    end
  end
end

Dre.configuration_on()