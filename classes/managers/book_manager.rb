require_relative '../models/book'
require_relative '../models/label'
require 'json'
require 'date'
require 'fileutils'

class BookManager
  attr_accessor :books, :labels

  def initalize
    @books = []
    @labels = []
  end
end