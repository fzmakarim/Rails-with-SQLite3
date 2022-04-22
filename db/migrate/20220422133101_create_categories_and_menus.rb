class CreateCategoriesAndMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_menus, id: false do |t|
      t.belongs_to :menu
      t.belongs_to :category

      t.timestamps
    end
  end
end
