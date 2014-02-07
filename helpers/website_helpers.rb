module MyExpenses
  module WebsiteHelpers
    def set_message(message, template, type = :error)
      type == :error ? @error = message : @success = message
      haml template
    end

    def redirect_home
      redirect '/'
    end

    def to_sentence(errors)
      errors.full_messages.flatten.join(', ')
    end
  end
end
