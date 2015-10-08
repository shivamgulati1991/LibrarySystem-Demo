class AddStatusToHistories < ActiveRecord::Migration
  def change
    add_column :histories, :status, :string
  end
end
