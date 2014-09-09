module Songify
  module Entities
    class Song
      attr_reader :name, :id
      def initialize(name, id=nil)
        @name, @id = name, id
      end
    end
  end
end
