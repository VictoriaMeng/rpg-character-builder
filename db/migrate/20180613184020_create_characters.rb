class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :gender
      t.string :race
      t.string :class
      t.integer :user_id
      t.integer :game_id
    end
  end
end
