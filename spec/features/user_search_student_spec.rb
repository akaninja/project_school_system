require 'rails_helper'

feature 'User searches for a student' do
  scenario 'successfully' do
    user = User.create(email: 'andre@aol.com.br', password: 'pipoca123')
    Student.create(name: 'Luiz Geraldo', phone: '8938344', email: 'luiz@uol.com.br', user: user)
    Student.create(name: 'Pedro Jaime', phone: '2938523', email: 'pedro@gmail.com', user: user)
    Student.create(name: 'Luiz Henrique', phone: '29388048', email: 'lhenrique@gmail.com', user: user)

    visit root_path
    fill_in 'Buscar aluno', with: 'Luiz'
    click_on 'Enviar aluno'

    expect(page).to have_css('h2', text: 'Luiz Geraldo')
    expect(page).to have_css('h2', text: 'Luiz Henrique')
    expect(page).not_to have_css('h2', text: 'Pedro Jaime')
    
  end
  
  scenario 'and finds no matches' do
    user = User.create(email: 'andre@aol.com.br', password: 'pipoca123')
    Student.create(name: 'Luiz Geraldo', phone: '8938344', email: 'luiz@uol.com.br', user: user)
    Student.create(name: 'Pedro Jaime', phone: '2938523', email: 'pedro@gmail.com', user: user)
    Student.create(name: 'Luiz Henrique', phone: '29388048', email: 'lhenrique@gmail.com', user: user)


    visit root_path
    fill_in 'Buscar aluno', with: 'José'
    click_on 'Enviar aluno'
    
    expect(page).to have_content('Nenhum resultado encontrado')
  end

  scenario 'by email successfully' do
    user = User.create(email: 'andre@aol.com.br', password: 'pipoca123')
    Student.create(name: 'Luiz Geraldo', phone: '8938344', email: 'luiz@uol.com.br', user: user)
    Student.create(name: 'Pedro Jaime', phone: '2938523', email: 'pedro@gmail.com', user: user)
    Student.create(name: 'Luiz Henrique', phone: '29388048', email: 'lhenrique@gmail.com', user: user)


    visit root_path
    fill_in 'Buscar aluno', with: 'luiz@uol.com.br'
    click_on 'Enviar aluno'
    expect(page).to have_css('h2', text: 'Luiz Geraldo')
    expect(page).not_to have_css('h2', text: 'Pedro Jaime')
  end

end
