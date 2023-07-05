require_relative '../models/game'
require_relative '../models/label'
require 'json'
require 'fileutils'

class GameManager
  attr_accessor :games, :labels

  def initialize
    @games = []
    @labels = []
  end

  def add_game
    display_message('Enter the game title: ')
    title = gets.chomp
    display_message('Enter the game\'s release date (YYYY-MM-DD): ')
    release_date = gets.chomp
    display_message('Enter the game publisher: ')
    publisher = gets.chomp
    display_message('Enter the game cover color: ')
    color = gets.chomp

    game_id = generate_game_id
    game = Game.new(id: game_id, title: title, publish_date: release_date, author: publisher, label: nil)

    label_id = generate_label_id
    label = Label.new(id: label_id, title: title, color: color)
  end

end