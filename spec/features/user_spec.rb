require 'rails_helper'

feature 'User', type: :feature do
  feature 'ユーザー登録前' do
    scenario 'ユーザー登録は可能か' do
      visit root_path
      click_on "SignUp"
      fill_in "user[name]", with: "yoshimochi"
      fill_in "user[email]", with: "yoshi@test.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_on "新規登録"
      expect(page).to have_current_path root_path
    end

    scenario 'ログインできないか' do
      visit root_path
      click_on "SignIn"
      fill_in "user[email]", with: "bbb@gmail.com"
      fill_in "user[password]", with: "1111111"
      click_on "ログイン"
      expect(page).to have_content "必須項目を入力してください。"
    end
  end

  feature 'ユーザー登録後', type: :feature do

    let(:user) {create(:user)}

    background do
      visit new_user_session_path
      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: user.password
      click_on "ログイン"
    end

    scenario 'ログインできているか' do
      expect(page).to have_current_path root_path
    end

    scenario 'ログアウトできるか' do
      click_on "SignOut"
      expect(page).to have_current_path root_path
    end
  end
end