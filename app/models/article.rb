class Article < ActiveRecord::Base
  belongs_to :group

  validates :title, presence: true

  delegate :to_s, to: :title
end
