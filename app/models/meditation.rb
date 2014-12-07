class Meditation < ActiveRecord::Base
  has_many :images, inverse_of: :meditation, dependent: :destroy
end
