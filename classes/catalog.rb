require_relative 'managers/book_manager'
require_relative 'managers/game_manager'
require_relative 'managers/music_manager'

class Catalog
  def initialize
    @book_manager = BookManager.new
    @game_manager = GameManager.new
    @music_manager = MusicManager.new
  end

  def list_all_books
    @book_manager.list_all_books
  end

  def list_all_games
    @game_manager.list_all_games
  end

  def list_all_music
    @music_manager.list_all_albums
  end

  def add_book
    @book_manager.add_book
  end

  def add_game
    @game_manager.add_game
  end

  def add_music
    @music_manager.add_album
  end
end
