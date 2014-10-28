class Tag < ActiveRecord::Base
  # Remember to create a migration!
  has_many :links
  has_many :posts, through: :links
end
