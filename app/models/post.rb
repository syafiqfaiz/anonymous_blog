class Post < ActiveRecord::Base
  # Remember to create a migration!
  has_many :links
  has_many :tags, through: :links
end
