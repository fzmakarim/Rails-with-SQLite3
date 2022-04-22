class ChangeOrderStatusColumn < ActiveRecord::Migration[7.0]
  def up
    rename_column :orders, :statusm, :status
  end

  def down
     rename_column :orders, :status, :statusm
  end
end
