class Article < ActiveRecord::Base
  acts_as_taggable
  has_many :comments, dependent: :destroy

  def self.search(query)
    if query
      Article.where('title LIKE ?', "%#{query}%").all
    else
      Article.all
    end
  end

end
