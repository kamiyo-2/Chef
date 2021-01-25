require 'rails_helper'

RSpec.describe Recipephoto, type: :model do
  before do
    @recipephoto = FactoryBot.build(:recipephoto)
  end

  describe 'ユーザー新規登録' do
    context '材料の登録がうまくいくとき' do
      it "text、sub＿imageが存在すれば登録できる" do
        expect(@recipephoto).to be_valid
      end
    end
    context '材料の登録がうまくいかないとき' do
      it 'textが空だと登録できない' do
        @recipephoto.text = ""
        @recipephoto.valid?
        expect(@recipephoto.errors.full_messages).to include("作り方を入力してください")
      end
    end
  end
end
