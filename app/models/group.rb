class Group < ActiveRecord::Base
  extend FriendlyId
  friendly_id :short_name, use: :slugged

  has_many :articles

  validates :name, presence: true
  validates :short_name, presence: true

  delegate :to_s, to: :name

end
