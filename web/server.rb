require_relative '../lib/songify.rb'
require 'sinatra/base'

class Songify::Server < Sinatra::Application
  configure do
    set :bind, '0.0.0.0'
  end

  # INDEX
  get '/songs' do  
    @songs = Songify.songs_repo.get_songs
    erb :index 
  end

  # NEW
  get '/songs/new' do
    erb :new
  end

  # SHOW
  get '/songs/:id' do
    @song = Songify.songs_repo.get_song_by_id(params[:id])
    erb :show
  end

  # CREATE
  post '/songs' do
    song = Songify::Entities::Song.new(params["name"])
    Songify.songs_repo.add_song(song)
    redirect to("/songs/#{song.id}")
  end
end
