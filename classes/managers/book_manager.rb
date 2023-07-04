require_relative '../models/book'
require_relative '../models/label'
require 'json'
require 'date'
require 'fileutils'

class BookManager
  attr_accessor :books, :labels

  def initialize
    @books = []
    @labels = []
  end

  def add_book
    display_message('Enter the book title: ')
    title = gets.chomp
    display_message('Enter the book cover color: ')
    color = gets.chomp
    display_message('Enter the book\'s publish date (YYYY-MM-DD): ')
    publish_date = gets.chomp
    display_message('Enter the book publisher: ')
    publisher = gets.chomp
    display_message('Enter the book author: ')
    author = gets.chomp
    display_message('Enter the book label: ')
    label_title = gets.chomp
    cover_condition = input_cover_condition

    book_id = generate_book_id
    book = Book.new(id: book_id, publisher: publisher, cover_state: cover_condition, title: title,
                    publish_date: publish_date, author: author, label: label_title)

    label_id = generate_label_id
    label = Label.new(id: label_id, title: label_title, color: color)

    @books.push(book)
    @labels.push(label)
    display_message('Book added successfully.')
    store_book(book)
    store_label(label)
  end

  def generate_book_id
    stored_books = load_data_from_file('data/books.json')
    stored_books.size
  end
