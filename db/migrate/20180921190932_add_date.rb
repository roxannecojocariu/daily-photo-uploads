class AddDate < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :date, :string, null: false
  end
end
