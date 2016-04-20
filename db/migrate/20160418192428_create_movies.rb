class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :tagline
      t.text   :overview
      t.string :photo_path
      t.string :genre
      t.string :runtime
      t.string :release_date
      t.boolean :approved, default: false

      t.timestamps null: false
    end
  end
end
