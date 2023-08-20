require_relative '../models/music_album'
require_relative '../models/label'
require 'json'
require 'fileutils'
require 'securerandom'

class MusicManager
  attr_accessor :albums, :labels

  def initialize
    @albums = []
    @labels = []
  end
  def add_album
    display_message('Enter the album title: ')
    title = gets.chomp
    display_message('Enter the album\'s release date (YYYY-MM-DD): ')
    release_date = gets.chomp
    display_message('Enter the album artist: ')
    artist = gets.chomp
    display_message('Enter the album cover color: ')
    color = gets.chomp
  
    label = Label.new(id: SecureRandom.uuid, title: title, color: color)
  
    album = MusicAlbum.new(on_spotify: false, title: title, publish_date: release_date, author: artist, label: label)
    @albums.push(album)
    @labels.push(label)
    display_message('Music album added successfully.')
    store_album(album)
    store_label(label)
  end


  def store_album(album)
    album_data = {
      id: album.id,
      title: album.title,
      author: album.author,
      release_date: album.publish_date
    }
  
    stored_albums = load_data_from_file('data/albums.json')
    stored_albums << album_data
    write_data_to_file('data/albums.json', stored_albums)
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
end