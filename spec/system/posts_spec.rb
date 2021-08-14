# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before do
    @user = FactoryBot.create(:user)
    sign_in @user
    @post = FactoryBot.create(:post, image: fixture_file_upload('public/images/no_image.jpg'))
  end

  describe '投稿のテスト' do
    let(:post) { create(:post, body: 'hoge') }

    describe '投稿一覧(posts_path)のテスト' do
      before do
        visit posts_path
      end

      context '表示の確認' do
        it '投稿内容に「いいね」が表示されているか' do
          expect(page).to have_content 'いいね'
        end
        it 'posts_pathが"/posts"であるか' do
          expect(current_path).to eq('/posts')
        end
      end
    end
  end
end
