require_relative './book'
require_relative './students'
require_relative './teacher'
require_relative './rental'
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
    @person = []
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
    @person.each do |i|
      puts "[#{i.role}] ID: #{i.id} Name: #{i.name}, Age: #{i.age}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    case type
    when '1'
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp
      permission = permission.capitalize
      if permission == 'N'
        @person.push(Student.new(age, name, classroom: 'null', parent_permission: false))
        puts "Student #{name} created succesfully!"
      elsif permission == 'Y'
        @person.push(Student.new(age, name, classroom: 'null', parent_permission: true))
        puts "Student #{name} created succesfully!"
      else
        puts " \n -- Student not created Please try again and specify the parent permission with a Y(y) or N(n) \n \n"
      end
    when '2'
      print 'Specialization: '
      specialization = gets.chomp
      @person.push(Teacher.new(age: age, name: name, specialization: specialization))
      puts "Teacher #{name} created succesfully!"
    end
  end

  def rent_book
    puts 'Select  a book from the following list by number'
    @books.each_with_index do |b, index|
      puts "#{index}) Title: #{b.title}, Author: #{b.author}"
    end
    book_id = gets.chomp
    book = @books[book_id.to_i]

    puts 'Select a person from the following list by number (not id)'
    @person.each_with_index do |i, index|
      puts "#{index}) Name: #{i.name}, Id: #{i.id}, Age: #{i.age}"
    end
    renter_id = gets.chomp
    renter = @person[renter_id.to_i]
    print 'Date: '
    date = gets.chomp
    @rentals.push(Rental.new(date: date, person: renter, book: book))
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
        rent_book
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
