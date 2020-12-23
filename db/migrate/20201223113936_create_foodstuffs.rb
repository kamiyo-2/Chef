class CreateFoodstuffs < ActiveRecord::Migration[6.0]
  def change
    create_table :foodstuffs do |t|
      t.string      :material,   null: false    
      t.string      :quantity,   null: false    
      t.references  :recipe,     foreign_key: true 
      t.timestamps
    end
  end
end
