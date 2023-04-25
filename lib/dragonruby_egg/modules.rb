module DragonrubyEgg
  module Modules
    module_function

    def get_module_url(repo_module)
      modules = Database.get_modules()

      modules.each do |_module|
        author = _module["author"]
        name = _module["name"]
        url = _module["github_url"]
        
        if repo_module.index(/^(#{author}.)?#{name}$/)
          is_correct = Event.emit(:input_correct, author, name)
          if is_correct
            return url
          end
        end
      end # modules each

      return nil
    end
  end
end