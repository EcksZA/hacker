require 'rails_helper'

describe Comment do

  it { should validate_presence_of :comment }
  it { should belong_to :link }

  it { should belong_to :commentable }
  it { should have_many :comments }
end
