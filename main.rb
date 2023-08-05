require_relative 'classes/catalog'

def main
  catalog = Catalog.new

  puts 'Welcome to our catalog!'

  loop do
    puts 'Choose an option:'
    puts '1. List all books'
    puts '2. List all games'
    puts '3. List all music'
    puts '4. Add a book'
    puts '5. Add a game'
    puts '6. Add a music album'
    puts '7. Exit'

    choice = gets.chomp.to_i

    case choice
    when 1
      catalog.list_all_books
    when 2
      catalog.list_all_games
    when 3
      catalog.list_all_music
    when 4
      catalog.add_book
    when 5
      catalog.add_game
    when 6
      catalog.add_music
    when 7
      break
    else
      puts 'Invalid option. Please try again.'
    end
  end

  puts 'Goodbye!'
end

main
