class Post < ApplicationRecord
  validates :body, presence: true
  belongs_to :user
  acts_as_votable

  resourcify
  
  def score
    self.get_upvotes.size - self.get_downvotes.size
  end
end
