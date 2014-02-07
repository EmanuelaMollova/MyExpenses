module MyExpenses
  module AuthenticationHelpers
    def user_logged?
      session[:username]
    end

    def short_password(password)
      "The password is too short." if password.size < 6
    end

    def passwords_dont_match(password, repeated_password)
      "The passwords don't match." if password != repeated_password
    end

    def protected!
      halt 401, (haml :unauthorized) unless user_logged?
    end
  end
end
