require 'rails_helper'

feature 'User edits student info' do
  scenario 'succesfully' do
    Student.create(name:'André H.', phone: '99999999', email: 'kanamura@gmail.com')
    Student.create(name:'João', phone: '99999999', email: 'joao@gmail.com')
    
    visit root_path
    click_on 'André H.'
    click_on 'Editar'
    fill_in 'Telefone', with: '92935255'
    click_on 'Enviar'

    expect(page).to have_css('p', text: '92935255')
  end

  scenario 'and must fill all fields' do
    Student.create(name:'André C.', phone: '99999999', email: 'kanamura@gmail.com')
    Student.create(name:'João', phone: '99999999', email: 'joao@gmail.com')
    
    visit root_path
    click_on 'André C.'
    click_on 'Editar'
    fill_in 'Telefone', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Não foi possível salvar alterações')
  end
end