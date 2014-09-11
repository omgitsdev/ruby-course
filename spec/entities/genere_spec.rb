require_relative '../spec_helper.rb'

describe Songify::Entities::Genre do
  let(:name) {"Death Metal"}
  let(:id) {3}

  describe '#intialize' do
    it "initates without an ID" do
      genre = Songify::Entities::Genre.new(name)
      expect(genre.name).to eq(name)
      expect(genre.id).to eq(nil)
    end

    it "intiates with an ID" do
      genre = Songify::Entities::Genre.new(name, id)
      expect(genre.name).to eq(name)
      expect(genre.id).to eq(id)
    end
  end
end