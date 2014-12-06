class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string      :title
      t.text        :body
      t.integer     :position
      t.belongs_to  :group

      t.timestamps
    end
  end
end
