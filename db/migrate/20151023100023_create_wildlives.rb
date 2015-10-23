class CreateWildlives < ActiveRecord::Migration
  def change
    create_table :wildlives do |t|

      t.timestamps null: false
    end
  end
end
