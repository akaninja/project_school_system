require 'rails_helper'

feature 'User views all created cards' do
  scenario 'successfully' do
    user1 = User.create!(email: 'andre@aol.com.br', password: 'pipoca123')
    user2 = User.create!(email: 'vini@uol.com.br', password: '123456') 
    student1 = Student.create!(name:'André H.', phone: '99999999', email: 'kanamura@gmail.com', user: user1)
    student2 = Student.create!(name:'João', phone: '99999999', email: 'joao@gmail.com', user: user1)
    student3 = Student.create!(name: 'Pedro Jaime', phone: '8938523', email: 'pedro@gmail.com', user: user2)
    student4 = Student.create!(name: 'Luiz Henrique', phone: '2538048', email: 'lhenrique@gmail.com', user: user2)

    card1 = Card.create(price: 40.0, classes: 24, student: student1)
    card2 = Card.create(price: 50.0, classes: 12, student: student2)
    card3 = Card.create(price: 44.0, classes: 36, student: student3)
    card4 = Card.create(price: 23.0, classes: 42, student: student4)

    visit root_path
    click_on 'Cartões'

    expect(current_path).to eq cards_path
    expect(page).to have_css('h2', text: card1.id)
    expect(page).to have_css('p', text: student1.name)
    
    expect(page).to have_css('h2', text: card2.id)
    expect(page).to have_css('p', text: student2.name)
    
    expect(page).to have_css('h2', text: card3.id)
    expect(page).to have_css('p', text: student3.name)
    
    expect(page).to have_css('h2', text: card4.id)
    expect(page).to have_css('p', text: student4.name)
    
  end
end
