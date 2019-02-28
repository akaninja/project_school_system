require 'rails_helper'

feature 'Admin register new teacher' do 
  scenario 'successfully' do
    user = User.create(email: 'andre@aol.com.br', password: 'pipoca123')

    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'andre@aol.com.br'
    fill_in 'Senha', with: 'pipoca123'
    click_on 'Enviar'
    click_on 'Cadastrar professor'
    fill_in 'Nome', with: 'André Kanamura'
    fill_in 'Telefone', with: '993811089'
    fill_in 'E-mail', with: 'kanamura@gmail.com'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'André Kanamura')
    expect(page).to have_css('h2', text: 'Detalhes:')
    expect(page).to have_css('p', text: '993811089')
    expect(page).to have_css('p', text: 'kanamura@gmail.com')    
  end

  scenario 'and must fill name' do
      user = User.create(email: 'andre@aol.com.br', password: 'pipoca123')

    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'andre@aol.com.br'
    fill_in 'Senha', with: 'pipoca123'
    click_on 'Enviar'
    click_on 'Cadastrar professor'
    fill_in 'Nome', with: ''
    fill_in 'Telefone', with: ''
    fill_in 'E-mail', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve preencher o campo Nome') 
  end

end
