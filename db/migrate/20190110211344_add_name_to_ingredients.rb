class AddNameToIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients , :name, :string
  
  end
end
