class PlayersController < ApplicationController

  get '/players' do
    @players = Player.all
    @user_players = []
      @players.each do |player|
        if player.user_id == current_user.id
          @user_players << player
        end
      end 
    erb :'/players/players'
  end

  get '/players/new' do
    @players = Player.all
    erb :'players/new'
  end

  post '/players' do
    @player = Player.create(params)
    @player.user_id = current_user.id
    @player.save
    redirect '/players'
  end

  get '/players/:id' do
    if logged_in?
      @player = Player.find(params[:id])
      if @player.user_id == current_user.id
        erb :'/players/show'
      else
        redirect '/players'
      end
    else
      redirect '/login'
    end
  end

  delete '/players/:id/delete' do
    @player = Player.find_by_id(params[:id])
    @player.destroy
    redirect '/players'
  end

  get '/players/:id/edit' do
    @player = Player.find_by_id(params[:id])
    erb :'/players/edit'
  end

  patch '/players/:id' do
    @player = Player.find_by_id(params[:id])
    @player.team = params[:team]
    @player.cost = params[:cost]
    @player.quantity = params[:quantity]
    @player.save
    redirect to "/players/#{@player.id}"
  end
end
