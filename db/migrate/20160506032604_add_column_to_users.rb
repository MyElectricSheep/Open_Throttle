class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pic, :string
    add_column :users, :first_name, :string
    add_column :users, :birthday, :date
  end
end
