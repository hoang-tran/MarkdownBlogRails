class Article < ActiveRecord::Base
  acts_as_taggable
  has_many :comments, dependent: :destroy
end
