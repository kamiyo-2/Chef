require 'rails_helper'

RSpec.describe Foodstuff, type: :model do
  before do
    @foodstuff = FactoryBot.build(:foodstuff)
  end

  describe 'ユーザー新規登録' do
    context '材料の登録がうまくいくとき' do
      it "material、quantityが存在すれば登録できる" do
        expect(@foodstuff).to be_valid
      end
    end
    context '材料の登録がうまくいかないとき' do
      it 'materialが空だと登録できない' do
        @foodstuff.material = ""
        @foodstuff.valid?
        expect(@foodstuff.errors.full_messages).to include("材料を入力してください")
      end
    
      it 'quantityが空だと登録できない' do
        @foodstuff.quantity = ''
        @foodstuff.valid?
        expect(@foodstuff.errors.full_messages).to include("分量を入力してください")
      end
    end
  end
end
