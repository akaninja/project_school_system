# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


    user1 = User.create(email: 'andre@uol.com.br', password: '123456')
    user2 = User.create(email: 'pedro@aol.com.br', password: 'pipoca123')


    Student.create(name:'André', phone: '99999999', email: 'kanamura@gmail.com', user: user1)
    Student.create(name:'João', phone: '99999999', email: 'joao@gmail.com', user: user1)
    Student.create(name:'Pedro', phone: '99999999', email: 'pedro@gmail.com', user: user1)

    Student.create!(name:'Luiz', phone: '99999999', email: 'luiz@gmail.com', user: user2)
    Student.create!(name:'Bruno', phone: '99999999', email: 'joao@gmail.com', user: user2)

    List.create(title: 'Boogie Woogie', user: user1)
    List.create(title: 'Lindy Hop', user: user1)
    List.create(title: 'Balboa', user: user2)
    List.create(title: 'Shag', user: user2)