class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.belongs_to :user, null: false
      t.string :description
      t.string :image
    end
  end
end
