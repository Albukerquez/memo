require 'rails_helper'

feature 'User authentication' do
  background do
    user = create(:user)
  end

  scenario 'can log in from the index via the navbar' do
    visit '/'
    expect(page).to_not have_content('Новый Пост')

    click_link 'Войти'
    fill_in 'Почта', with: 'foo@bar.com'
    fill_in 'Пароль', with: 'foobar'
    click_button 'Войти'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to_not have_content('Регистрация')
    expect(page).to have_content('Выйти')
  end

  scenario 'can log out once logged in' do
    visit '/'
    click_link 'Войти'
    fill_in 'Почта', with: 'foo@bar.com'
    fill_in 'Пароль', with: 'foobar'
    click_button 'Войти'

    click_link 'Выйти'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario 'cannot view index posts without logging in' do
    visit '/'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario 'cannot create a new post without logging in' do
    visit new_post_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
