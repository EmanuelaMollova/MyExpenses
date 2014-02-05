module MyExpenses
  class AuthenticationController < MyExpensesBase
    helpers AuthenticationHelpers

    get '/login' do
      haml :login
    end

    get '/register' do
      haml :register
    end
  end
end
