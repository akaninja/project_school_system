require 'rails_helper'

feature 'User logs in' do 
  scenario 'successfully' do
    User.create(email: 'andre@aol.com.br', password:
               'pipoca123')
 
    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'andre@aol.com.br'
    fill_in 'Senha', with: 'pipoca123'
    click_on 'Enviar'
    

    expect(page).to have_content('Bem vindo, andre@aol.com.br')
    expect(page).to have_link('Sair')
    expect(page).not_to have_link('Entrar')
  end

  scenario 'and enters wrong user or password' do
    User.create(email: 'andre@aol.com.br', password:
                'pipoca123')
 
    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'paulo'
    fill_in 'Senha', with: 'ofwowfo'
    click_on 'Enviar'
    
    expect(page).to have_link('Entrar')
    expect(page).to have_content('Invalid Email or password.')
  end
end
