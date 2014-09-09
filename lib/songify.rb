require 'pg'
require 'rspec'
require 'pry-byebug'
# we initialize the module here to use in our other files
module PuppyBreeder
end

require_relative 'songify/entities/song.rb'
require_relative 'songify/repositories/songs.rb'