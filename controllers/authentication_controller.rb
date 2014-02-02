module MyExpenses
  class AuthenticationController < MyExpensesBase
    get '/login' do
      haml :login
    end

    get '/register' do
      haml :register
    end
  end
end
