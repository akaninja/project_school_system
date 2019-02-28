require 'rails_helper'

feature 'User mark student as highlighted' do
  scenario 'favorite successfully' do
    user = User.create(email: 'andre@aol.com.br', password: 'pipoca123')
    student = Student.create(name: 'Pedro Jaime', phone:       '8938523', email: 'pedro@gmail.com', favorite: false, user: user)

    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'andre@aol.com.br'
    fill_in 'Senha', with: 'pipoca123'
    click_on 'Enviar'

    
    click_on 'Favoritar'
    student.reload

    expect(page).to have_content('Desfavoritar')
    expect(page).not_to have_content('Favoritar')
    expect(student.favorite).to eq true
  end

  scenario 'and unfavorite successfully' do
    user = User.create(email: 'andre@aol.com.br', password: 'pipoca123')
    student = Student.create(name: 'Pedro Jaime', phone:       '8938523', email: 'pedro@gmail.com', favorite: true, user: user)

    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'andre@aol.com.br'
    fill_in 'Senha', with: 'pipoca123'
    click_on 'Enviar'
    click_on 'Desfavoritar'
    student.reload

    expect(page).to have_content('Favoritar')
    expect(page).not_to have_content('Desfavoritar')
    expect(student.favorite).to eq false
  end

end