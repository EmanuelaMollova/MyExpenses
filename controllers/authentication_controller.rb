module MyExpenses
  class AuthenticationController < MyExpensesBase
    helpers AuthenticationHelpers

    get '/register' do
      haml :register
    end

    get '/login' do
      haml :login
    end

    post '/register' do
      @error = long_enough(params[:password])
      @error = passwords_match(params[:password], params[:repeated_password])
      if !@error
        user = User.new(username: params[:username], password: params[:password])
        if !user.save
          @error = to_sentence(user.errors)
        else
          @success = "Your registration is successful."
          haml :login
        end
      end
      haml :register
    end
  end
end
