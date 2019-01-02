class ChangeColumnTypeRecipes < ActiveRecord::Migration[5.1]
  def change
    change_column :recipes, :description ,:text
  end
end
