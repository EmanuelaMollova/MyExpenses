module MyExpenses
  module AuthenticationHelpers
    def user_logged?
      session[:username]
    end

    def set_navigation_bar
      user_logged? ? :logged_navigation_bar : :not_logged_navigation_bar
    end
  end
end
