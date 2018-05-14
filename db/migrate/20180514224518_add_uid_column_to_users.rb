class AddUidColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :uid, :integer, limit: 25
  end
end
