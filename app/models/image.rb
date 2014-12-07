class Image < ActiveRecord::Base
  belongs_to :meditation, inverse_of: :images
end
