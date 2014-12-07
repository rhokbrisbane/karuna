class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :short_title, use: :slugged

  belongs_to :group

  has_attached_file :featured_image, :styles => { :thumb => "100x100>", :medium => "300x300>" }, :default_url => "/default_hero.jpg"
  validates_attachment :featured_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

  validates :title, :short_title, presence: true

  delegate :to_s, to: :title

end
