require 'rails_helper'

describe "the user CRUD process" do
  it "creates a new user who has a unique name" do
    visit '/users/new'
    user = User.new(name: 'example')
    fill_in 'Name', with: 'example'
    click_button 'Create User'
    expect(page).to have_content 'Homepage'
  end

  it "doesn't allow a duplicate user name to be used" do
    visit '/users/new'
    user_1 = User.create(name: 'example')
    user_2 = User.new(name: 'example')
    fill_in 'Name', with: 'example'
    click_button 'Create User'
    expect(page).to have_content 'Create a new username'
  end

  it "destroys an existing user" do
    user1 = User.create(name: 'example', id: 1)
    visit '/users/1/edit'
    click_link 'Delete'
    expect(page).to have_content 'Homepage'
  end

  it "creates a new link for the user" do
    user1 = User.create(name: 'example', id: 1 )
    visit '/users/1'
    click_link 'Create a new Link!'
    expect(page).to have_content 'Add A New Link'
  end
end
