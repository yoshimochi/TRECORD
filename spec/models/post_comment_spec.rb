require 'rails_helper'

RSpec.describe 'Commentモデルのテスト', type: :model do
  let(:user) { create(:user) }
  let!(:post) { build(:post, user_id: user.id)}
  let!(:post_comment) { build(:post_comment, user_id: user.id, post_id: post.id) }

  # describe 'バリデーションのテスト' do
  #   context '投稿の確認' do
  #     it 'commentが空欄でないこと' do
  #       post_comment = PostComment.new(post_id:1, user_id:1, comment: '')
  #       expect(:post_comment).to be_valid
  #       expect(book.errors[:title]).to include("can't be blank")
  #     end
  #   end
  # end

  describe 'モデルのテスト' do
    it "有効なコメントの場合は保存されるか" do
      expect(FactoryBot.build(:post_comment)).to be_valid
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1の関係になっている' do
        expect(PostComment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Postモデルとの関係' do
      it 'N:1の関係となっていること' do
        expect(PostComment.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
  end
end