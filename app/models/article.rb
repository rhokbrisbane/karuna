class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :short_title, use: :slugged

  belongs_to :group

  validates :title, presence: true
  validates :short_title, presence: true

  delegate :to_s, to: :title

end
