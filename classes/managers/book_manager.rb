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

  def generate_label_id
    stored_labels = load_data_from_file('data/labels.json')
    stored_labels.size
  end

  def input_cover_condition
    loop do
      display_message('Enter the book cover condition (GOOD or BAD): ')
      cover_condition = gets.chomp.upcase
      return cover_condition if %w[GOOD BAD].include?(cover_condition)

      display_message('Invalid cover condition. Please enter either GOOD or BAD.')
    end
  end

  def store_book(book)
    book_data = {
      id: book.id,
      title: book.title,
      publisher: book.publisher,
      publish_date: book.publish_date,
      cover_condition: book.cover_state
    }

    stored_books = load_data_from_file('data/books.json')
    stored_books << book_data
    write_data_to_file('data/books.json', stored_books)
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

  def list_all_books
    @books = load_data_from_file('data/books.json')
    @books.each do |book|
      display_message("Book Title: #{book['title']}, Publisher: #{book['publisher']},
        Publish Date: #{book['publish_date']}, Cover Condition: #{book['cover_condition']}")
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
