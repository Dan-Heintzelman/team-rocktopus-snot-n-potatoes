class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :photo
      t.string :genre
      t.string :run_time

      t.timestamps null: false
    end
  end
end
