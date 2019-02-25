require 'rails_helper'

feature 'User searches for a student' do
  scenario 'successfully' do
    Student.create(name: 'Luiz Geraldo', phone: '8938344', email: 'luiz@uol.com.br')
    Student.create(name: 'Pedro Jaime', phone: '2938523', email: 'pedro@gmail.com')

    visit root_path
    fill_in 'Buscar aluno', with: 'Luiz Geraldo'
    click_on 'Enviar aluno'

    expect(page).to have_css('p', text: 'Luiz Geraldo')
    expect(page).not_to have_css('p', text: 'Pedro Jaime')
  end
  
  scenario 'and finds no matches' do
  
  end

end
