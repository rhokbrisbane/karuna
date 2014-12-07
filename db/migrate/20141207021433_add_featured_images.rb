class AddFeaturedImages < ActiveRecord::Migration
  def change
    add_attachment :groups, :featured_image
    add_attachment :articles, :featured_image
  end
end
