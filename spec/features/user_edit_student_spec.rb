require 'rails_helper'

feature 'User edits student info' do
  scenario 'succesfully' do
    Student.create(name:'André K.', phone: '99999999', email: 'kanamura@gmail.com')
    Student.create(name:'João', phone: '99999999', email: 'joao@gmail.com')
    
    visit root_path
    click_on 'André K.'
    click_on 'Edit'
    fill_in 'Telefone', with: '92935255'
    click_on 'Enviar'

    expect(page).to have_css('p', text: '92935255')
  end
end