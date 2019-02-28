require 'rails_helper'

feature 'User views list of 6 students on index' do
  scenario 'successfully' do
    user = User.create(email: 'andre@aol.com.br', password: 'pipoca123')
    Student.create!(name: 'Pedro Jaime', phone: '8938523', email: 'pedro@gmail.com', user: user)
    Student.create!(name: 'Luiz Henrique', phone: '2538048', email: 'lhenrique@gmail.com', user: user)
    Student.create!(name: 'José', phone: '356356', email: 'jose@gmail.com', user: user)
    Student.create!(name: 'Caio', phone: '4674676', email: 'caio@gmail.com', user: user)
    Student.create!(name: 'Antonio', phone: '7347367', email: 'antonio@gmail.com', user: user)
    Student.create!(name: 'Apolonio', phone: '735737', email: 'apolonio@gmail.com', user: user)
    Student.create!(name: 'Ricardo', phone: '22454252', email: 'ricardo@gmail.com', user: user)
    Student.create!(name: 'Paulo', phone: '225245245', email: 'paulo@gmail.com', user: user)

    visit root_path

    expect(page).to have_css('p', text: 'Paulo')
    expect(page).to have_css('p', text: 'Ricardo')
    expect(page).to have_css('p', text: 'Apolonio')
    expect(page).to have_css('p', text: 'Antonio')
    expect(page).to have_css('p', text: 'Caio')
    expect(page).to have_css('p', text: 'José')

    expect(page).not_to have_css('p', text: 'Pedro Jaime')
    expect(page).not_to have_css('p', text: 'Luiz Henrique')
  end
end
