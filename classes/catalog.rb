require_relative 'managers/book_manager'
require_relative 'managers/game_manager'
require_relative 'managers/music_manager'

class Catalog
  def initialize
    @book_manager = BookManager.new
    @game_manager = GameManager.new
    @music_manager = MusicManager.new
  end


end
