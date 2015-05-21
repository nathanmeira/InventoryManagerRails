class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :product_id
      t.string :name
      t.float :price
      t.float :cost

      t.timestamps null: false
    end
  end
end
