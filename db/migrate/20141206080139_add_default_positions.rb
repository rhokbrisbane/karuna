class AddDefaultPositions < ActiveRecord::Migration
  def change
    change_column :groups, :position, :integer, default: 1
    change_column :articles, :position, :integer, default: 1
  end
end
