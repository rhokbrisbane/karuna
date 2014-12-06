class Group < ActiveRecord::Base
  has_many :articles

  validates :name, presence: true

  delegate :to_s, to: :name
end
