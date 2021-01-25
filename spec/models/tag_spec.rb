require 'rails_helper'
RSpec.describe Tag, type: :model do
  before do
    @tag = FactoryBot.build(:tag)
  end

  describe 'タグ新規投稿' do
    context '新規登録がうまくいくとき' do
      it "name、tag_imageが存在すれば登録できる" do
        expect(@tag).to be_valid
      end
    end

    context '新規投稿機能がうまくいかないとき' do 
      it "main_imageが空だと登録できない" do
        @tag.tag_image = nil
        @tag.valid?
        expect(@tag.errors.full_messages).to include("画像を入力してください")
      end
      it "titleが空だと登録できない" do
        @tag.name = ""
        @tag.valid?
        expect(@tag.errors.full_messages).to include("タイトルを入力してください")
      end
    end
  end
end
