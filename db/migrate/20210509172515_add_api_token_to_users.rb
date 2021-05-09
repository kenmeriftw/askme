class AddApiTokenToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :api_token, :text, null: true
    add_index :users, :api_token, unique: true
  end
end
