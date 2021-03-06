require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "football_index"
    use Rack::Flash
  end

  helpers do
    def current_user
      @user = User.find_by_id(session[:user_id])
    end

    def logged_in?
      session[:user_id]
    end

    def login(email, password)
      user = User.find_by(email: params["email"])
      if user && user.authenticate(password)
        session[:user_id] = user.id
        redirect '/players'
      else
        flash[:message] = "Please provide a valid email/password combination."
        erb :'/users/login'
      end
    end
  end

  get "/" do
    if logged_in?
      redirect '/players'
    else
      erb :index
    end
  end

end
