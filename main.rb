require_relative 'actions'

class App
  include Action

  def initialize()
    @books = []
    @people = []
    @rentals = []
  end

  def initial_menu
    puts 'Please choose an option by entering a number
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - exit'
    @num = gets.chomp
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def run
    puts "Welcome to School Library App! \n \n"
    initial_menu
    while @num != '7'
      case @num
      when '1'
        display_books
      when '2'
        display_users
      when '3'
        create_person
      when '4'
        create_book
      when '5'
        rent_book
      when '6'
        rental_for_id
      end
      initial_menu
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end

def main
  app = App.new
  app.run
end

main
