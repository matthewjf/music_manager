class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.references :band, index: true, foreign_key: true, null: false
      t.string :alb_t, null: false

      t.timestamps null: false
    end
  end
end
