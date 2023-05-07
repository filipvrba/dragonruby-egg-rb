module DragonrubyEgg
  module IO
    module_function

    def change_require(module_path, repo_module)
      rb_files = Dir.glob("#{module_path}/**/*.rb")
      rb_files.each do |path|
        content = nil
        File.open path do |f|
          h_change = lambda do |*e|
            result = e[0]
            e[1].each do |k|
              result = result
              .gsub("require \"#{k}", "require \"modules/#{repo_module}/#{k}")
              .gsub("require \'#{k}", "require \'modules/#{repo_module}/#{k}")
            end
            result
          end

          content = h_change.call(f.read, ['app', 'lib'])
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