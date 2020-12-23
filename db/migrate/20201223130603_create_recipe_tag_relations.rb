class CreateRecipeTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_tag_relations do |t|
      t.references :recipe, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
