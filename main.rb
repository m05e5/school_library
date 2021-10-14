require_relative './book'
require_relative './students.rb'
require_relative './teacher.rb'
require_relative './rental.rb'
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
    @students = []
    @teachers = []
    @rentals = []
  end

  def create_book
    puts "\n"
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    @books.push(Book.new(title: title, author: author))
  end

  def display_books
    @books.each do |i|
      puts "Title: #{i.title}, Author: #{i.author}"
    end
    puts "\n"
  end

  def display_persons
    @students.each do |i|
      puts "[student] ID: #{i.id} Name: #{i.name}, Age: #{i.age}"
    end
    @teachers.each do |i|
      puts "[Teacher] ID: #{i.id} Name: #{i.name}, Age: #{i.age}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = gets.chomp
    case type
    when '1'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      @students.push(Student.new(age, name, classroom: 'null'))
      puts "Student #{name} created succesfully!"
    when '2'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
      @teachers.push(Teacher.new(age: age, name: name, specialization: specialization))
      puts "Teacher #{name} created succesfully!"
    end
  end

  def rent_book 
    puts 'Select  a book from the following list by number'
    @books.each{ |b, index|
      puts "#{index}) Title: #{b.title}, Author: #{b.author}"
    }
    book = gets.chomp
    rentals.push(Rental.new(date: date, person: person, book: book))
  end

  def run
    puts "Welcome to School Library App! \n \n"
    puts @start
    @num = gets.chomp
    while @num != '7'
      case @num
      when '1'
        display_books
      when '2'
        display_persons
      when '3'
        create_person
      when '4'
        create_book
      when '5'
        puts 'hello 5'
      when '6'
        puts 'hello 6'
      end
      puts @start
      @num = gets.chomp
    end
  end
end

def main
  app = App.new
  app.run
end

main
