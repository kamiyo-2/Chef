require 'rails_helper'

RSpec.describe '新規投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @recipe = FactoryBot.build(:recipe, user_id: @user.id)
    @recipe.id = 1
    @recipe.save
    @foodstuff = FactoryBot.build(:foodstuff, recipe_id: @recipe.id)
    @foodstuff.recipe_id = @recipe.id
    @foodstuff.save
    @recipephoto = FactoryBot.build(:recipephoto, recipe_id: @recipe.id)
    @recipephoto.recipe_id = @recipe.id
    @recipephoto.save

  end
  context '新規投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('レシピ 投稿')
      # 投稿ページに移動する
      visit new_recipe_path
      # フォームに情報を入力する
      fill_in 'recipe_title', with: @recipe.title
      fill_in 'recipe_process', with: @recipe.process
      fill_in 'recipe_details', with: @recipe.details
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      attach_file('recipe[main_image]', image_path, make_visible: true)
      #送信するを押すと、recipe_detail_recipe_path(@recipe.id)に遷移するしRecipeモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Recipe.count }.by(1)
      # フォームに情報を入力する
      fill_in 'foodstuff_material', with: @foodstuff.material
      fill_in 'foodstuff_quantity', with: @foodstuff.quantity
      click_button "追加"
      # フォームに情報を入力する
      fill_in 'recipephoto_text', with: @recipephoto.text
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      attach_file('recipephoto[sub_image]', image_path, make_visible: true)
      click_button "追加する"
      # 送信するとトップページに遷移することを確認する
      click_link "公開する"
      visit root_path
      # トップページには先ほど投稿した内容の画像が存在することを確認する（画像）
      expect(page).to have_selector "img"
      # トップページには先ほど投稿した内容のテキストが存在することを確認する（テキスト）
      expect(page).to have_content(@recipe.title)
    end
  end
  context '新規投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_content('レシピ 投稿')
    end
  end
end

