class AddIsbnColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ISBN, :string
  end
end
