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
      @error =
        short_password(params[:password]) or
        passwords_dont_match(params[:password], params[:repeated_password])
      if !@error
        user = User.new(username: params[:username], password: params[:password])
        if !user.save
          @error = to_sentence(user.errors)
          haml :register
        else
          @success = "Your registration is successful."
          haml :login
        end
      else
        haml :register
      end
    end
  end
end
