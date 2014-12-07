class CreateMeditations < ActiveRecord::Migration
  def change
    create_table :meditations do |t|
      t.string :name
      t.string :description
      t.string :media_url

      t.timestamps
    end
  end
end
