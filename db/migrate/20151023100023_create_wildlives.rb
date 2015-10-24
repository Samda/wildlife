class CreateWildlives < ActiveRecord::Migration
  def change
    create_table :wildlives do |t|
      t.string :name
      t.string :description
      t.string :lifespan
      t.string :mass
      t.string :speed
      t.attachment :avatar
      t.timestamps null: false
    end
  end
end
