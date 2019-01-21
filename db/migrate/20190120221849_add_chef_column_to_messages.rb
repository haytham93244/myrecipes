class AddChefColumnToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :chef_id, :integer 
  end
end
