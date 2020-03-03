require 'rails_helper'

def send_friendship_request
  click_link 'All users'
  expect(find_all('.users-list li').count > 1).to be(true)
  @count = find_all('.profile-link').count
  first(:link, 'Invite to Friendship').click
end

def change_logged_in_user
  click_link 'Sign out'
  within('form') do
    fill_in 'Email', with: 'carl@gmail.com'
    fill_in 'Password', with: 'password'
  end
  click_button 'Log in'
end

RSpec.describe 'User', type: :feature do
  include Integration
  before(:each) do
    create_multiple_users
    visit_page_and_fill_in_form
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  it 'User can see invite to friendship link in user show page' do
    click_link 'All users'
    first(:link, 'See Profile').click
    expect(page).to have_content('Invite to Friendship')
  end

  it 'User can send friendship request' do
    send_friendship_request
    expect(page).to have_content('Congrats!! carl has recieved your friendship request!!!')
    expect(find_all('.profile-link').count).to eq(@count - 1)
  end

  it 'User can accept friendship request' do
    send_friendship_request
    change_logged_in_user
    click_link 'Invitations'
    expect(page).to have_content('john')
    expect(find_all('a.profile-link').count).to eq(3)
    click_link 'Accept'
    expect(page).to have_content('You have accepted john as your friend!!!')
  end

  it 'User can reject friendship request' do
    send_friendship_request
    change_logged_in_user
    click_link 'Invitations'
    expect(page).to have_content('john')
    expect(find_all('a.profile-link').count).to eq(3)
    click_link 'Decline'
    expect(page).to have_content('You have rejected john as your friend!!')
  end
end

RSpec.describe 'User', type: :feature do
  include Integration
  before(:each) do
    create_multiple_users
    visit_page_and_fill_in_form
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  it 'User can see number of comments' do
    click_link 'Timeline'
    create_posts
    expect(find_all('li.post').count).to be(2)
    page.all(:fillable_field, 'comment[content]').first.set('This is a new comment')
    first(:button, 'Comment').click
    page.all(:fillable_field, 'comment[content]').first.set('This is a new comment')
    first(:button, 'Comment').click
    expect(page).to have_content('2 Comments')
  end
end

RSpec.describe 'User', type: :feature do
  include Integration
  before(:each) do
    create_multiple_users
    visit_page_and_fill_in_form
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  it 'User can see number of likes' do
    click_link 'Timeline'
    create_posts
    expect(find_all('li.post').count).to be(2)
    expect(page).to have_content('0 Likes')
    first(:link, 'Like!').click
    expect(page).to have_content('1 Like')
  end
end
