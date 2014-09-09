require_relative '../spec_helper.rb'

describe Songify::Entities::Song do
  let(:name) {"Hakuna Matata"}
  let(:id) {3}

  describe '#intialize' do
    it "initates without an ID" do
      song = Songify::Entities::Song.new(name)
      expect(song.name).to eq(name)
      expect(song.id).to eq(nil)
    end

    it "intiates with an ID" do
      song = Songify::Entities::Song.new(name, id)
      expect(song.name).to eq(name)
      expect(song.id).to eq(id)
    end
  end
end