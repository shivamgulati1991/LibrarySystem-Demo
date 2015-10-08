class AddWantBookToBooks < ActiveRecord::Migration
  def change
    add_column :books, :want_book, :integer
  end
end
