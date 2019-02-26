require 'rails_helper'

feature 'User mark student as highlighted' do
  scenario 'favorite successfully' do

    Student.create(name: 'Pedro Jaime', phone:       '8938523', email: 'pedro@gmail.com', favorite: true)

    visit root_path
    click_on 'Favoritar'

    expect(page).to have_content('Desfavoritar')
  end

  scenario 'and unfavorite successfully' do
    
    Student.create(name: 'Pedro Jaime', phone:         '8938523', email: 'pedro@gmail.com', favorite: false)

    visit root_path
    click_on 'Desfavoritar'

    expect(page).to have_content('Favoritar')
  end

end