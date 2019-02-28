require 'rails_helper'

feature 'User visits his students list page ' do
  scenario 'and views list of his students only' do
    user1 = User.create!(email: 'andre@aol.com.br', password: 'pipoca123')
    user2 = User.create!(email: 'vini@uol.com.br', password: '123456') 
    Student.create!(name:'André H.', phone: '99999999', email: 'kanamura@gmail.com', user: user1)
    Student.create!(name:'João', phone: '99999999', email: 'joao@gmail.com', user: user1)
    Student.create!(name: 'Pedro Jaime', phone: '8938523', email: 'pedro@gmail.com', user: user2)
    Student.create!(name: 'Luiz Henrique', phone: '2538048', email: 'lhenrique@gmail.com', user: user2)

    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'andre@aol.com.br'
    fill_in 'Senha', with: 'pipoca123'
    click_on 'Enviar'
    click_on 'Meus alunos' 

    expect(current_path).to eq my_students_path
    expect(page).to have_css('h2', text: 'André H.')
    expect(page).to have_css('h2', text: 'João')
    expect(page).not_to have_css('h2', text: 'Pedro Jaime')
    expect(page).not_to have_css('h2', text: 'Luiz Henrique')

  end

  scenario 'and  must be logged in' do
    visit my_students_path

    expect(current_path).to eq user_session_path
    expect(page).to have_content('Forgot your password?')
  end

end
