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
  end
end