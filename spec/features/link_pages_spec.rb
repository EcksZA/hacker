require 'rails_helper'

describe 'link internal maneuverability' do
  it "allow the submitted user's page to be accessed" do
    link = Link.create(id: 1)
    visit '/links/1'
    click_link 'Link_Text'
    expect(page).to have 'RubyFan'
  end
end
