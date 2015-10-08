class AddWantBookToUsers < ActiveRecord::Migration
  def change
    add_column :users, :want_book, :integer
  end
end
