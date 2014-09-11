require 'pg'
require 'rspec'
require 'pry-byebug'
require_relative 'songify/entities/song.rb'
require_relative 'songify/repositories/songs.rb'

# we initialize the module here to use in our other files
module Songify
  def self.songs_repo=(repo)
    @songs_repo = repo
  end
  def self.songs_repo
    @songs_repo
  end
end

Songify.songs_repo = Songify::Repositories::Songs.new('songify_test')

