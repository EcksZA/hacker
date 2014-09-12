require 'rails_helper'

describe Comment do

  it { should validate_presence_of :comment }
  it { should validate_presence_of :link_id }
  it { should belong_to :link }
end
