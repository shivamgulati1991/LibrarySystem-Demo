class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :name
      t.string :email
      t.string :ISBN
      t.string :title
      t.string :author
      t.text :description

      t.timestamps null: false
    end
  end
end
