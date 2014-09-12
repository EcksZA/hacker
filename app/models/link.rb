class Link < ActiveRecord::Base

  validates :title, presence: true
  validates :user_id, presence: true
  validates :url, presence: true
  belongs_to :user
  has_many :votes
  has_many :comments

  def vote_count
    votes.count
  end
end
