class AddUrlFieldsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :video_link, :string
    add_column :articles, :audio_link, :string
  end
end
