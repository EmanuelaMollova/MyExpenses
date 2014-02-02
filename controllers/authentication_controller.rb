module MyExpenses
  class AuthenticationController < MyExpensesBase
    helpers AuthenticationHelpers

    get '/login' do
      haml set_navigation_bar, :layout => :layout do
        haml :login
      end
    end

    get '/register' do
      haml set_navigation_bar, :layout => :layout do
        haml :register
      end
    end
  end
end
