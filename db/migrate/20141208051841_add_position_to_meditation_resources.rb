class AddPositionToMeditationResources < ActiveRecord::Migration
  def change
    add_column :meditations, :position, :integer, default: 1
    add_column :images, :position, :integer, default: 1
  end
end
