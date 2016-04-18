class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :review, index: true, foreign_key: true
      t.boolean :helpful

      t.timestamps null: false
    end
  end
end
