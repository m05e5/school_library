
require_relative './book.rb'
class App
  def initialize()
    @start = 'Please choose an option by entering a number
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - exit'
    @books = []
    @persons = []
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts @start
    @num = gets.chomp
  end

  def display_books
    
  end

  def run
    puts "Welcome to School Library App! \n \n"
    puts @start
    @num = gets.chomp
    while @num != '7'
      case @num
      when '1'
        puts 'hello 1'
      when '2'
        puts 'hello 2'
      when '3'
        puts 'hello 3'
      when '4'
        create_book()
      when '5'
        puts 'hello 5'
      when '6'
        puts 'hello 6'
      else
        puts start
        @num = gets.chomp
      end
    end
  end
end

def main
  app = App.new()
  app.run()
end

main()