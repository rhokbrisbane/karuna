class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :short_title, use: :slugged

  belongs_to :group

  validates :title, :short_title, presence: true

  mount_uploader :featured_image, FeaturedImageUploader, :mount_on => :featured_image_file_name

  delegate :to_s, to: :title

end
