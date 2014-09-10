require 'rails_helper'

describe 'link internal maneuverability' do
  it "allow the submitted user's page to be accessed" do
    user = User.create(name: 'Ryan')
    link = Link.create(user_id: user.id, url: 'example.com', title: 'Example')
    visit '/links'
    click_link('Ryan')
    expect(page).to have_content 'Create a new Link!'
  end
end
