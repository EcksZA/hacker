class Comment < ActiveRecord::Base
  validates :comment, presence: true
  validates :link_id, presence: true

  belongs_to :link
end
