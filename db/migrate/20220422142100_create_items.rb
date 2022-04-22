class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.belongs_to :order
      t.belongs_to :menu
      t.integer :total
      t.decimal :price

      t.timestamps
    end
  end
end
