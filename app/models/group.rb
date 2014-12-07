class Group < ActiveRecord::Base
  extend FriendlyId
  friendly_id :short_name, use: :slugged

  has_many :articles, -> { order('articles.position') },
    autosave: true, inverse_of: :group

  validates :name, :short_name, presence: true

  mount_uploader :featured_image, FeaturedImageUploader, :mount_on => :featured_image_file_name

  delegate :to_s, to: :name
end
