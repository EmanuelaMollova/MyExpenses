module MyExpenses
  class WebsiteController < MyExpensesBase
    helpers AuthenticationHelpers

    get '/' do
      redirect '/user/login' if not user_logged?
      haml :home
    end
  end
end
