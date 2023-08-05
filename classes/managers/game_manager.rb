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

    @games.push(game)
    @labels.push(label)
    display_message('Game added successfully.')
    store_game(game)
    store_label(label)
  end

  def generate_game_id
    stored_games = load_data_from_file('data/games.json')
    stored_games.size
  end

  def generate_label_id
    stored_labels = load_data_from_file('data/labels.json')
    stored_labels.size
  end

  def store_game(game)
    game_data = {
      id: game.id,
      title: game.title,
      publisher: game.author,
      release_date: game.publish_date
    }

    stored_games = load_data_from_file('data/games.json')
    stored_games << game_data
    write_data_to_file('data/games.json', stored_games)
  end

  def store_label(label)
    label_data = {
      id: label.id,
      title: label.title,
      color: label.color
    }

    stored_labels = load_data_from_file('data/labels.json')
    stored_labels << label_data
    write_data_to_file('data/labels.json', stored_labels)
  end

  def load_data_from_file(file_path)
    return [] unless File.exist?(file_path)

    data = File.read(file_path)
    data.empty? ? [] : JSON.parse(data)
  rescue Errno::ENOENT
    []
  end

  def write_data_to_file(file_path, data)
    FileUtils.mkdir_p('data')
    File.write(file_path, data.to_json)
  end

  def list_all_games
    @games = load_data_from_file('data/games.json')
    @games.each do |game|
      display_message("Game Title: #{game['title']}, Publisher: #{game['author']},
        Release Date: #{game['release_date']}")
    end
  end

  def list_all_labels
    @labels = load_data_from_file('data/labels.json')
    @labels.each do |label|
      display_message("Label: #{label['title']}, Color: #{label['color']}")
    end
  end

  private

  def display_message(message)
    puts '╔' + '═' * (message.length + 2) + '╗'
    puts '║ ' + message.chomp + ' ║'
    puts '╚' + '═' * (message.length + 2) + '╝'
  end
end