class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :email_customer
      t.string :statusm, default: "NEW"
      t.decimal :total_price, default: 0
bu
      t.timestamps
    end
  end
end
