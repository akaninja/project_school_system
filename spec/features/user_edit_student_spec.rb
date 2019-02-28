require 'rails_helper'

feature 'User edits student info' do
  scenario 'succesfully' do
    user = User.create(email: 'andre@aol.com.br', password: 'pipoca123')
    Student.create!(name:'André H.', phone: '99999999', email: 'kanamura@gmail.com', user: user)
    Student.create!(name:'João', phone: '99999999', email: 'joao@gmail.com', user: user)
    
    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'andre@aol.com.br'
    fill_in 'Senha', with: 'pipoca123'
    click_on 'Enviar'
    click_on 'André H.'
    click_on 'Editar'
    fill_in 'Telefone', with: '92935255'
    click_on 'Enviar'

    expect(page).to have_css('p', text: '92935255')
  end

  scenario 'and must fill all fields' do
    user = User.create(email: 'andre@aol.com.br', password:
               'pipoca123')
    Student.create!(name:'André C.', phone: '99999999', email: 'kanamura@gmail.com', user: user)
    Student.create!(name:'João', phone: '99999999', email: 'joao@gmail.com', user: user)
    
    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'andre@aol.com.br'
    fill_in 'Senha', with: 'pipoca123'
    click_on 'Enviar'
    click_on 'André C.'
    click_on 'Editar'
    fill_in 'Telefone', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Não foi possível salvar alterações')
  end

  scenario 'and must be signed in' do
    user = User.create(email: 'andre@aol.com.br', password: 'pipoca123')
    Student.create!(name:'André C.', phone: '99999999', email: 'kanamura@gmail.com', user: user)
    visit edit_student_path(1)

    expect(current_path).to eq user_session_path
    expect(page).to have_content('Forgot your password?')

  end

  scenario 'is not logged in and cant see the edit and delete buttons' do
    user = User.create(email: 'andre@aol.com.br', password: 'pipoca123')
    Student.create!(name:'André C.', phone: '99999999', email: 'kanamura@gmail.com', user: user)

    visit student_path(1)

    expect(page).not_to have_content('Excluir')
    expect(page).not_to have_content('Editar')
  
  end

end