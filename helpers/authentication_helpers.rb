module MyExpenses
  module AuthenticationHelpers
    def user_logged?
      session[:username]
    end
  end
end
