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
  end
end