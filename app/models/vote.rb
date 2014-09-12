class Vote < ActiveRecord::Base

  validates :link_id, presence: true
  belongs_to :link
end
