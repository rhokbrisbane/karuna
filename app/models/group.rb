class Group < ActiveRecord::Base
  extend FriendlyId
  friendly_id :short_name, use: :slugged

  has_attached_file :featured_image, :styles => { :thumb => "100x100>", :medium => "300x300>" }, :default_url => "/default_hero.jpg"
  validates_attachment :featured_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

  has_many :articles, -> { order('articles.position') },
    autosave: true, inverse_of: :group

  validates :name, :short_name, presence: true

  delegate :to_s, to: :name
end
