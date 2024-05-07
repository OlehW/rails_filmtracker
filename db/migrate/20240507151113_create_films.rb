class CreateFilms < ActiveRecord::Migration[7.1]
  def change
    create_table :films do |t|
      t.string :title
      t.string :director
      t.integer :duration
      t.integer :year
      t.string :genre
      t.text :description

      t.timestamps
    end
  end
end
