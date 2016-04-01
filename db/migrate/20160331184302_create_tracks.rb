class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.references :album, index: true, foreign_key: true, null: false
      t.string :track_t, null: false
      t.text :lyrics

      t.timestamps null: false
    end
  end
end
