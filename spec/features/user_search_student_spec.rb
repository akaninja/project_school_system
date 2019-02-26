require 'rails_helper'

feature 'User searches for a student' do
  scenario 'successfully' do
    Student.create(name: 'Luiz Geraldo', phone: '8938344', email: 'luiz@uol.com.br')
    Student.create(name: 'Pedro Jaime', phone: '2938523', email: 'pedro@gmail.com')
    Student.create(name: 'Luiz Henrique', phone: '29388048', email: 'lhenrique@gmail.com')

    visit root_path
    fill_in 'Buscar aluno', with: 'Luiz'
    click_on 'Enviar aluno'

    expect(page).to have_css('h2', text: 'Luiz Geraldo')
    expect(page).to have_css('h2', text: 'Luiz Henrique')
    expect(page).not_to have_css('h2', text: 'Pedro Jaime')
    
  end
  
  scenario 'and finds no matches' do
    Student.create(name: 'Pedro Jaime', phone: '2938523', email: 'pedro@gmail.com')
    Student.create(name: 'Luiz Henrique', phone: '29388048', email: 'lhenrique@gmail.com')

    visit root_path
    fill_in 'Buscar aluno', with: 'José'
    click_on 'Enviar aluno'
    
    expect(page).to have_content('Nenhum resultado encontrado')
  end

  scenario 'by email successfully' do
    Student.create(name: 'Luiz Geraldo', phone: '8938344', email: 'luiz@uol.com.br')
    Student.create(name: 'Pedro Jaime', phone: '2938523', email: 'pedro@gmail.com')

    visit root_path
    fill_in 'Buscar aluno', with: 'luiz@uol.com.br'
    click_on 'Enviar aluno'
    expect(page).to have_css('h2', text: 'Luiz Geraldo')
    expect(page).not_to have_css('h2', text: 'Pedro Jaime')
  end

end
