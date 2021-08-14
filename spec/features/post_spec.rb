require 'rails_helper'

describe '投稿機能のテスト'do
  before do
    @user = FactoryBot.create(:user)
    @post_text = Faker::Lorem.sentence
  end
  context '投稿に成功する'do
    it 'ログインしたユーザーは新規投稿できる' do
      visit new_user_session_path
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      click_on "ログイン"
      expect(current_path).to eq(root_path)
      # 投稿一覧画面に移動する
      click_on "Posts"
      expect(current_path).to eq(posts_path)
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('新規投稿')
      # 投稿ページに移動する
      visit new_post_path
      # フォームに情報を入力する
      fill_in 'post[body]', with: @post_text
      # 送信するとPostモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Post.count }.by(1)
      # 投稿完了ページに遷移することを確認する
      expect(current_path).to eq(posts_path)
    end
  end
end