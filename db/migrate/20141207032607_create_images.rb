class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :alt
      t.string :url
      t.references :meditation, index: true

      t.timestamps
    end
  end
end
