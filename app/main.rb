require 'dragonruby_egg'
require 'option_parser'
require 'json_parser'

require_relative './configuration'
require_relative './arguments'
require_relative './inputs'

module Dre
  module_function

  def root_path_state
    sym = :root_path
    root_path = @options[sym]
    if root_path
      if root_path == ''
        DragonrubyEgg::Event.print('WARNING', "An empty string for" +
          "the root path is not acceptable.")
        @configuration.delete(sym)
        configuration_on()
      else
        @configuration.parse(sym, root_path)
        DragonrubyEgg::Event.print('SET', "#{sym.to_s}: #{root_path.to_s}")
      end
    end
  end

  def main_state
    if options_empty?
      DragonrubyEgg::Executable.dragonruby(@options[:path])
    elsif @options[:is_docs]
      DragonrubyEgg::Executable.docs()
    elsif @options[:install]
      if @options[:path]
        DragonrubyEgg::Executable.install(@options[:install], @options[:path])
      else
        DragonrubyEgg::Event.print('WARNING', "A working path must " +
          "be defined to install the module.")
      end
    end
  end
end

Dre.root_path_state()
Dre.main_state()