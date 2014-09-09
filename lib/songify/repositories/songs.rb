module Songify
  module Repositories
    class Songs
      def initialize(dbname)
      @db = PG.connect(host: 'localhost', dbname: dbname)
      command = <<-SQL
      CREATE TABLE IF NOT EXISTS songs(
        id SERIAL PRIMARY KEY,
        name TEXT);
      SQL
      @db.exec(command)
    end

    def add_song(song)
      command = <<-SQL
      INSERT INTO songs (name) 
      VALUES ('#{song.name}')
      RETURNING id;
      SQL
      result = @db.exec(command)
      song.add_id(result[0]["id"].to_i)
    end

    def get_songs
      command = <<-SQL
      SELECT * FROM songs;
      SQL
      result = @db.exec(command)
      result.entries.map do |x|
        Songify::Entities::Song.new(x["name"], x["id"].to_i)
      end
    end

    def get_song_by_id(id)
      command = <<-SQL
      SELECT * FROM songs WHERE id = $1;
      SQL
      result = @db.exec(command, [id])
      Songify::Entities::Song.new(result.entries.first["name"], result.entries.first["id"].to_i)
    end

    def delete_song_by_id(id)
      command = <<-SQL
      DELETE FROM songs WHERE id = $1;
      SQL
      @db.exec(command, [id])
    end
    def reset_repo #for testing purposes
      command = <<-SQL
      TRUNCATE songs RESTART IDENTITY CASCADE;
      SQL
      @db.exec(command)
    end
  end
  end
end
