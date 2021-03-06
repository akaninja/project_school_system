require 'rails_helper'

feature 'User register new card for a student' do
  scenario 'successfully' do
    user = User.create(email: 'andre@aol.com.br', password: 'pipoca123')
    Student.create(name:'André K.', phone: '99999999', email: 'kanamura@gmail.com', user: user)
    Student.create(name:'João', phone: '99999999', email: 'joao@gmail.com', user: user)
    
    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'andre@aol.com.br'
    fill_in 'Senha', with: 'pipoca123'
    click_on 'Enviar'
    click_on 'Gerar cartão'
    select 'André K.', from: 'Aluno'
    fill_in 'Valor', with: 40.0
    fill_in 'Quantidade de aulas', with: 12
    click_on 'Enviar'

    #expect(page).to have_css('h1', text: "#{@card.id}")
    expect(page).to have_css('p', text: 'André K.')
    expect(page).to have_css('p', text: '40.0')
    expect(page).to have_css('p', text: '12 aulas')

  end

  scenario 'and must fill all fields' do
    user = User.create(email: 'andre@aol.com.br', password: 'pipoca123')
    Student.create(name:'André K.', phone: '99999999', email: 'kanamura@gmail.com', user: user)
    Student.create(name:'João', phone: '99999999', email: 'joao@gmail.com', user: user)
    
    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'andre@aol.com.br'
    fill_in 'Senha', with: 'pipoca123'
    click_on 'Enviar'
    click_on 'Gerar cartão'
    #select '', from: 'Aluno'
    fill_in 'Valor', with: ''
    fill_in 'Quantidade de aulas', with: ''
    click_on 'Enviar'
  
    expect(page).to have_content('Você deve preencher todos os campos')

  end
end
