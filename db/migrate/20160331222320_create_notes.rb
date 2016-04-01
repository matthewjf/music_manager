class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :track, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.text :text, null: false

      t.timestamps null: false
    end
  end
end
