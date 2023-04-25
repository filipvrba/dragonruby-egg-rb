require 'rest-client'
require 'json'

module DragonrubyEgg
  module Database
    GUARD_MODULES = "Ku3biL772AhmQndV"
    DB_NAME = 1

    module_function

    def get_modules
      rest_data = RestClient.get('https://bef.fly.dev/api/v1/guard', {
        params: {
          token: GUARD_MODULES,
          database: DB_NAME
        }
      })
      return JSON.parse(rest_data)
    end
  end
end