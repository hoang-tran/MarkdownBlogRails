include ActionView::Helpers::DateHelper

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

  def created_date_string
    'Created at ' + time_ago_in_words(self.created_at) + ' ago'
  end

  def view_count_string
    "#{self.view_count} views"
  end

  def comment_count_string
    "#{self.comments.count} comments"
  end

  def details_string
    "#{created_date_string}, #{view_count_string}, #{comment_count_string}"
  end

end
