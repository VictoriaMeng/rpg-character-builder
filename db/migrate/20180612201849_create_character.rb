class CreateCharacter < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :race
      t.string :gender
      t.string :age
      t.string :body_type
      t.string :skin_color
      t.string :eye_color
      t.string :hair_color
    end
  end
end
