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

    def web_brower
      %x(xdg-settings get default-web-browser)
        .sub(/\..*$/, '').rstrip
    end

    def dragonruby arg
      root_path = Event::emit(:root_path)
      path = File.join(root_path, Constants::DR_EXES[:dr])
      system("#{path} #{arg}")
    end

    def docs
      root_path = Event::emit(:root_path)
      doc_file = File.join(root_path, Constants::DR_DOCS)
      system("#{web_brower} #{doc_file} &")
    end

    def egg
      root_path = Event::emit(:root_path)
      system("#{web_brower} #{Constants::DRE_URL} &")
    end

    def install repo_module, path
      module_url = Modules.get_module_url(repo_module)
      unless module_url
        return
      end
      module_path = "#{path}/modules/#{repo_module}"

      is_install = system("git clone --recurse-submodules #{module_url}.git '#{module_path}'")
      if is_install
        Event.print('INSTALL', "The '#{repo_module}' module " +
          "has been installed in this '.#{module_path.sub(path, '')}' folder.")
      end
    end

    def new_project name, path
      root_path = Event::emit(:root_path)
      unless path
        path = Dir.pwd
      end
      is_copy = system("cp -r '#{root_path}/mygame' '#{path}/#{name}'")
      if is_copy
        Event.print('NEW', "The '#{name}' project has been created.")
      end
    end
  end
end