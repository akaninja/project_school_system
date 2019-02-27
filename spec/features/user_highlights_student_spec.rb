require 'rails_helper'

feature 'User mark student as highlighted' do
  scenario 'favorite successfully' do

    student = Student.create(name: 'Pedro Jaime', phone:       '8938523', email: 'pedro@gmail.com', favorite: false)

    visit root_path
    click_on 'Favoritar'
    student.reload

    expect(page).to have_content('Desfavoritar')
    expect(page).not_to have_content('Favoritar')
    expect(student.favorite).to eq true
  end

  scenario 'and unfavorite successfully' do
    
    student = Student.create(name: 'Pedro Jaime', phone:         '8938523', email: 'pedro@gmail.com', favorite: true)

    visit root_path
    click_on 'Desfavoritar'
    student.reload

    expect(page).to have_content('Favoritar')
    expect(page).not_to have_content('Desfavoritar')
    expect(student.favorite).to eq false
  end

end