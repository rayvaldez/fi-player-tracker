class PlayersController < ApplicationController

  get '/players' do
    @players = Player.all
    erb :'/players/players'
  end

  get '/players/new' do
    @players = Player.all
    erb :'players/new'
  end

  post '/players' do
    @player = Player.create(params)
    redirect '/players'
  end
end
