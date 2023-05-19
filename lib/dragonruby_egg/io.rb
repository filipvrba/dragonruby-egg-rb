module DragonrubyEgg
  module IO
    module_function

    def change_content(content, repo_module, keywords, find_keyword = '')
      h_change = lambda do |*e|
        result = e[0]
        e[1].each do |k|
          result = result
          .gsub("#{find_keyword}\"#{k}", "#{find_keyword}\"modules/#{repo_module}/#{k}")
          .gsub("#{find_keyword}\'#{k}", "#{find_keyword}\'modules/#{repo_module}/#{k}")
        end
        result
      end

      h_change.call(content, keywords)
    end

    def change_paths(module_path, repo_module)
      rb_files = Dir.glob("#{module_path}/**/*.rb")
      rb_files.each do |path|
        content = nil
        File.open path do |f|
          content = f.read
        end
        if content
          # Require
          content = change_content(content, repo_module, ['app', 'lib'], 'require ')
          # Path for assets
          content = change_content(content, repo_module, ['sounds/', 'sprites/', 'fonts/', 'data/'])

          File.open path, "w+" do |f|
            f.write content
          end
        end
      end
    end
  end
end