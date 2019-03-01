require 'rails_helper'

feature 'User creates a students list' do
  scenario 'and adds a student' do

    user = User.create(email: 'andre@uol.com.br', password: '123456')
    Student.create(name:'André', phone: '99999999', email: 'kanamura@gmail.com', user: user)
    Student.create(name:'João', phone: '99999999', email: 'joao@gmail.com', user: user)
    Student.create(name:'Pedro', phone: '99999999', email: 'pedro@gmail.com', user: user)

    List.create(title: 'Boogie Woogie', user: user)
    List.create(title: 'Lindy Hop', user: user)
    
    login_as user, scope: :user

    visit root_path
    click_on 'João'
    select 'Boogie Woogie', from: 'Lista'
    click_on 'Adicionar'

    expect(current_path).to eq list_path(1)
    expect(page).to have_css('h1', text: 'Boogie Woogie')
    expect(page).to have_css('p', text: 'João')
    expect(page).not_to have_css('p', text: 'Pedro')

  end

  scenario 'clicking the create list link' do
    user = User.create(email: 'andre@uol.com.br', password: '123456')

    List.create(title: 'Boogie Woogie', user: user)
    List.create(title: 'Lindy Hop', user: user)
    
    login_as user, scope: :user
    visit root_path
    click_on 'Minhas listas'
    fill_in 'Título', with: 'Rockabilly'
    click_on 'Criar lista'

    expect(current_path).to eq lists_path
    expect(page).to have_css('h1', text: 'Minhas listas')
    expect(page).to have_css('h2', text: 'Boogie Woogie')
    expect(page).to have_css('h2', text: 'Lindy Hop')
    expect(page).to have_css('h2', text: 'Rockabilly')

  end

  scenario 'e precisa estar logado' do
    
    visit lists_path

    expect(current_path).to eq user_session_path

  end


end

