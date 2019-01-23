class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    if !(params.has_value?(""))
      @user = User.create(params)

      erb :'/players/players'
    else
      redirect '/signup'
    end
  end
end
