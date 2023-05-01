module DragonrubyEgg
  module IO
    module_function

    def change_require(module_path, repo_module)
      rb_files = Dir.glob("#{module_path}/**/*.rb")
      rb_files.each do |path|
        content = nil
        File.open path do |f|
          content = f.read.gsub("require \"lib", "require \"modules/#{repo_module}/lib")
        end
        if content
          File.open path, "w+" do |f|
            f.write content
          end
        end
      end
    end
  end
end