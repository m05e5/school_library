require_relative './book'
require_relative './students'
require_relative './teacher'
require_relative './rental'

module Action

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
      case permission
      when 'N'
        @person.push(Student.new(age, name, classroom: 'null', parent_permission: false))
        puts "Student #{name} created succesfully!"
      when 'Y'
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

  def rental_for_id
    print 'Id of person: '
    p_id = gets.chomp
    @rentals.each do |i|
      puts "Date: #{i.date}, Book \"#{i.book.title}\" by #{i.person.name}" if p_id.to_i == i.person.id
    end
  end
end
