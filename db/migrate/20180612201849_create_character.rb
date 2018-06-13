class CreateCharacter < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :race
      t.string :gender
      t.integer :user_id
      t.integer :game_id
    end
  end
end
