require 'rails_helper'
RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント新規投稿' do
    context '新規登録がうまくいくとき' do
      it "textが存在すれば登録できる" do
        expect(@comment).to be_valid
      end
    end

    context '新規投稿機能がうまくいかないとき' do 
      it "textが空だと登録できない" do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("コメントを入力してください")
      end
    end
  end
end
