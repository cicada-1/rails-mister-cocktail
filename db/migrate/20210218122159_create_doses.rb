class CreateDoses < ActiveRecord::Migration[6.0]
  def change
    create_table :doses do |t|
      t.string :description
      t.references :cocktail_id, null: false, foreign_key: true
      t.references :ingredient_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
