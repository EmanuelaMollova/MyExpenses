module MyExpenses
  class WebsiteController < MyExpensesBase
    get '/' do
      redirect '/user/login' if not user_logged?
      haml :home
    end

    helpers AuthenticationHelpers
  end
end
