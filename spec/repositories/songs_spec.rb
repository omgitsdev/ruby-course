
require_relative '../spec_helper.rb'

describe Songify::Repositories::Songs do
  before :all do
    @songs = Songify::Repositories::Songs.new("songify_test")
  end

  before do
    @songs.reset_repo
  end

  let(:song) {Songify::Entities::Song.new("Hakuna Matata")}
  let(:song2) {Songify::Entities::Song.new("Circle of Life")}

  describe '#initialize' do
    it "Initializes with a supplied database" do
      result = @songs.get_songs
      expect(result.size).to eq(0)
    end
  end

  describe '#add_songs' do
    it "Adds a song to the database" do
      result = @songs.get_songs
      expect(result.size).to eq(0)
      @songs.add_song(song)
      result = @songs.get_songs
      expect(result.size).to eq(1)
      expect(result[0].name).to eq("Hakuna Matata")
    end

    it "Assigns an ID" do
      @songs.add_song(song)
      expect(song.id).to be_a(Fixnum)
    end
  end

  describe '#get_song_by_id' do
    it "Returns a song given an ID" do
      @songs.add_song(song) #ID 1
      @songs.add_song(song2)  #ID 2
      result = @songs.get_song_by_id(1)
      expect(result.name).to eq(song.name)
      result = @songs.get_song_by_id(2)
      expect(result.name).to eq(song2.name)
    end
  end

  describe '#delte_song_by_id' do
    it 'removes a song from database given ID' do
      @songs.add_song(song) #ID 1
      @songs.add_song(song2) #ID 2
      result = @songs.get_songs
      expect(result.size).to eq(2)  #Two entires in table
      @songs.delete_song_by_id(2) #delete song 2
      result = @songs.get_songs
      expect(result.size).to eq(1)  #one entry in table
      result = @songs.get_song_by_id(1)
      expect(result.name).to eq(song.name)  #remaining song is song 1
    end
  end
end