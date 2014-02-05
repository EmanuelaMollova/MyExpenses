module MyExpenses
  module WebsiteHelpers
    def set_message(message, template, type = :error)
      type == :error ? @error = message : @success = message
      haml template
    end
  end
end
