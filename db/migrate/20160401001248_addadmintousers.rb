class Addadmintousers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    change_column :users, :admin, :boolean, default: true
  end
end
