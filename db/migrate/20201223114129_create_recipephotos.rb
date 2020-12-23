class CreateRecipephotos < ActiveRecord::Migration[6.0]
  def change
    create_table :recipephotos do |t|
      t.text        :text,   null: false    
      t.references  :recipe, foreign_key: true 
      t.timestamps
    end
  end
end
