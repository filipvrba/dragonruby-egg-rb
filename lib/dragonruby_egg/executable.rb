module DragonrubyEgg
  module Executable
    module_function

    def root_path? path
      exes = Constants::DR_EXES.map { |_,v| File.join(path, v) }
      exes.each do |exe|
        is_existing = File.exist?(exe) && File.executable?(exe)
        unless is_existing
          return false
        end
      end

      return true 
    end

    def find_root_path(root = '/')
      paths = Dir.glob(
        "#{root}/**/#{Constants::DR_EXES[:dr]}",
        File::FNM_DOTMATCH
      )
      paths.each do |path|
        if File.exist?(path)
          r_path = File.dirname(path)
          if root_path?(r_path)
            return r_path
          end
        end
      end

      return nil
    end

    def dragonruby arg
      root_path = Event::emit(:root_path)
      path = File.join(root_path, Constants::DR_EXES[:dr])
      system("#{path} #{arg}")
    end

    def docs
      web_brower = %x(xdg-settings get default-web-browser)
        .sub(/\..*$/, '').rstrip
      root_path = Event::emit(:root_path)
      doc_file = File.join(root_path, Constants::DR_DOCS)
      system("#{web_brower} #{doc_file}")
    end
  end
end