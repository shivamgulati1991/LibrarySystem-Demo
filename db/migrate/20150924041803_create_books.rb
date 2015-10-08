class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :ISBN
      t.string :author
      t.text :description
      t.string :title
      t.string :status

      t.timestamps null: false
    end
  end
end
