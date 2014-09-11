require 'server_spec_helper'

describe Songify::Server do

  def app
    Songify::Server.new
  end

  describe "GET /" do
    it "loads the homepage" do
     Songify.songs_repo.reset_repo
     Songify.songs_repo.add_song(Songify::Entities::Song.new("Hakuna Matata"))

      get '/songs'
      # binding.pry
      expect(last_response).to be_ok
      expect(last_response.body).to include("Hakuna Matata")
    end
  end

  describe "GET /songs/id" do
    it "displays a single song" do
      Songify.songs_repo.reset_repo
      Songify.songs_repo.add_song(Songify::Entities::Song.new("Be Prepared"))
      song = Songify.songs_repo.get_songs.last
      get "/songs/#{song.id}"
      
      expect(last_response).to be_ok
      expect(last_response.body).to include("Be Prepared")
    end
  end

  describe "GET /songs/new" do
    it "displays a form for user input of new song name" do
      get '/songs/new'
      
      puts last_response.errors
      expect(last_response).to be_ok
    end
  end

  describe "POST /songs" do
    it "adds a new song to database and displays the song" do
      Songify.songs_repo.reset_repo
      post '/songs', {"name" => "Circle of Life"}

      last_song = Songify.songs_repo.get_songs.last
      expect(last_song.name).to eq("Circle of Life")
      expect(last_response.status).to eq(302)
    end
  end
end





