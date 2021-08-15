# frozen_string_literal: true

require 'rails_helper'

describe 'User認証' do
  describe 'ログイン前' do
    describe 'ユーザー新規登録' do
      before do
        visit new_user_registration_path
      end

      context '新規登録画面に遷移' do
        it '新規登録に成功する' do
          fill_in 'user[name]', with: 'test_user'
          fill_in 'user[email]', with: 'test@example.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button '新規登録'
        end
        it '新規登録に失敗する' do
          fill_in 'user[name]', with: ''
          fill_in 'user[email]', with: ''
          fill_in 'user[password]', with: ''
          fill_in 'user[password_confirmation]', with: ''
          click_button '新規登録'
        end
      end
    end
  end
end
