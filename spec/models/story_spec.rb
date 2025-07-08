require 'rails_helper'

RSpec.describe Story, type: :model do
  before do
    @story = FactoryBot.create(:user)
    @story = FactoryBot.build(:story, user: @user)
  end

  describe '物語投稿' do
    context '物語投稿できる場合' do
      it 'category_id、genre_id、title、bodyが存在すれば登録できる' do
        
      end
    end

    context '物語投稿できない場合' do
      it 'category_idが1では登録できない' do
        @story.category_id = 1
        @story.valid?
        expect(@story.errors.full_messages).to include("Category プルダウンを選択してください")
      end
      it 'genre_idが1では登録できない' do
        @story.genre_id = 1
        @story.valid?
        expect(@story.errors.full_messages).to include("Genre プルダウンを選択してください")
      end
      it 'titleが空では登録できない' do
        @story.title = ''
        @story.valid?
        expect(@story.errors.full_messages).to include("Title can't be blank")
      end
      it 'bodyが空では登録できない' do
        @story.body = ''
        @story.valid?
        expect(@story.errors.full_messages).to include("Body can't be blank")
      end
      it 'bodyが300文字以下では登録できない' do
        @story.body = Faker::Lorem.paragraph_by_chars(number: 299)
        @story.valid?
        expect(@story.errors.full_messages).to include('Body 300〜10000文字以内で入力してください')
      end
      it 'bodyが10000文字以上では登録できない' do
        @story.body = Faker::Lorem.paragraph_by_chars(number: 10001)
        @story.valid?
        expect(@story.errors.full_messages).to include('Body 300〜10000文字以内で入力してください')
      end
      it 'userが紐づいていなければ登録できない' do
        @story.user = nil
        @story.valid?
        expect(@story.errors.full_messages).to include('User must exist')
      end
    end
  end

end