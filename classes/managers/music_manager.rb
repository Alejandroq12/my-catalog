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

    label = Label.new(id: SecureRamdom.uuid, title: title, color: color)

    @albums = MusicAlbum.new(on_spotify: false, title: title, publish_date: release_date, author: artist, label: label)

  end
end