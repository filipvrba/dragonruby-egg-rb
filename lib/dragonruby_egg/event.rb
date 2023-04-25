module DragonrubyEgg
  module Event
    HANDLERS = {}
    @is_print_active = true

    module_function

    def set_print_active(bool)
      @is_print_active = bool
    end

    def print(event, message = "")
      unless @is_print_active
        return
      end

      puts("#{Time.now.strftime("%l:%M:%S %p").lstrip} [#{APP_NAME}] #{event} | #{message}")
    end

    def add(symbol, handler)
      HANDLERS[symbol] = handler
    end

    def emit(symbol, *args)
      HANDLERS[symbol].call(args)
    end
  end
end