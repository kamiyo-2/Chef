require 'rails_helper'
RSpec.describe Recipe, type: :model do
  before do
    @recipe = FactoryBot.build(:recipe)
  end

  describe 'レシピ新規投稿' do
    context '新規登録がうまくいくとき' do
      it "title、details、process、main_imageが存在すれば登録できる" do
        expect(@recipe).to be_valid
      end
    end

    context '新規投稿機能がうまくいかないとき' do 
      it "main_imageが空だと登録できない" do
        @recipe.main_image = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("画像を入力してください")
      end
      it "titleが空だと登録できない" do
        @recipe.title = ""
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("料理名を入力してください")
      end
      it "detailsが空だと登録できない" do
        @recipe.details = ""
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("何人前を入力してください")
      end
      it "processが空だと登録できない" do
        @recipe.process = ""
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("紹介文を入力してください")
      end
    end
  end
end
