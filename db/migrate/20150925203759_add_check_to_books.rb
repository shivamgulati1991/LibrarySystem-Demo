class AddCheckToBooks < ActiveRecord::Migration
  def change
    add_column :books, :check, :boolean
  end
end
