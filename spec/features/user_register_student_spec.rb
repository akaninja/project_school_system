require 'rails_helper'

feature 'User register student' do
  scenario 'successfully' do
    visit root_path
    click_on 'Cadastrar aluno'
    fill_in 'Nome', with: 'João Natali'
    fill_in 'Telefone', with: '991713080'
    fill_in 'E-mail', with: 'jnatali@gmail.com'
    click_on 'Enviar'
    # Na página do professor, onde vai ser possível editar os dados e excluir o cadastro.

    expect(page).to have_css('h1', text: 'João Natali')
    expect(page).to have_css('h2', text: 'Detalhes:')
    expect(page).to have_css('p', text: '991713080')
    expect(page).to have_css('p', text: 'jnatali@gmail.com')

  end
  
  scenario 'and must fill all fields' do
    visit root_path
    click_on 'Cadastrar aluno'
    fill_in 'Nome', with: ''
    fill_in 'Telefone', with: ''
    fill_in 'E-mail', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve preencher todos os campos') 
  end

end
