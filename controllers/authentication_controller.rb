module MyExpenses
  class AuthenticationController < MyExpensesBase
    helpers AuthenticationHelpers
    helpers DataBaseHelpers::UserHelpers

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

    post '/login' do
      user = find_user_by_username_and_password(params[:username], params[:password])
      if user.size == 1
        session[:username] = params[:username]
        redirect '/'
      else
        @error = "Wrong username or password."
        haml :login
      end
    end
  end
end
