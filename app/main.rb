require 'dragonruby_egg'
require 'option_parser'
require 'json_parser'

require_relative './configuration'
require_relative './arguments'

module Dre
  module_function

  def root_path_state
    sym = :root_path
    root_path = @options[sym]
    if root_path
      l_set_print = lambda do |rp|
        DragonrubyEgg::Event.print('SET', "#{sym.to_s}: #{rp.to_s}")
      end

      if root_path == ''
        DragonrubyEgg::Event.print('WARNING', "An empty string for" +
          "the root path is not acceptable.")
        @configuration.delete(sym)
        configuration_on()
        l_set_print.call(@configuration.parse(sym))
      else
        @configuration.parse(sym, root_path)
        l_set_print.call(root_path)
      end
    end
  end

  
end

Dre.root_path_state()
