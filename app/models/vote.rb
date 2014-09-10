class Vote < ActiveRecord::Base

  # validates :user_id, presence: true
  validates :link_id, presence: true
  # validates :total, presence: true

  belongs_to :user
  belongs_to :link
end
