# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


    user1 = User.create(email: 'andre@uol.com.br', password: '123456')
    user2 = User.create(email: 'pedro@aol.com.br', password: 'pipoca123')


    student1 = Student.create(name:'André', phone: '99999999', email: 'kanamura@gmail.com', user: user1)
    student2 = Student.create(name:'João', phone: '99999999', email: 'joao@gmail.com', user: user1)
    student3 = Student.create(name:'Pedro', phone: '99999999', email: 'pedro@gmail.com', user: user1)

    student4 = Student.create!(name:'Luiz', phone: '99999999', email: 'luiz@gmail.com', user: user2)
    Student.create!(name:'Bruno', phone: '99999999', email: 'joao@gmail.com', user: user2)

    List.create(title: 'Boogie Woogie', user: user1)
    List.create(title: 'Lindy Hop', user: user1)
    List.create(title: 'Balboa', user: user2)
    List.create(title: 'Shag', user: user2)

    card1 = Card.create(price: 40.0, classes: 24, student: student1)
    card2 = Card.create(price: 50.0, classes: 12, student: student2)
    card3 = Card.create(price: 44.0, classes: 36, student: student3)
    card4 = Card.create(price: 23.0, classes: 42, student: student4)