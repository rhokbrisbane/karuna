class ChangeDescriptionToText < ActiveRecord::Migration
  def change
    change_column :groups, :description, :text
  end
end
