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
  end
end