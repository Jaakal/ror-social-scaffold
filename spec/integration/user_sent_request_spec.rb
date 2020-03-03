require 'rails_helper'

RSpec.describe 'User', type: :feature do
  include Integration
  before(:each) do
    create_multiple_users
    visit_page_and_fill_in_form
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  context 'User Sent Friendship request' do
    it 'is successful' do
      click_link 'All users'
      expect(find_all('.users-list li').count > 1).to be(true)
      count = find_all('.profile-link').count
      first(:link, 'Invite to Friendship').click
      expect(page).to have_content('Congrats!! carl has recieved your friendship request!!!')
      expect(find_all('.profile-link').count).to eq(count - 1)
    end
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

  context 'User can see number of comments' do
    it 'is successful' do
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
end

RSpec.describe 'User', type: :feature do
  include Integration
  before(:each) do
    create_multiple_users
    visit_page_and_fill_in_form
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  context 'User can see number of likes' do
    it 'is successful' do
      click_link 'Timeline'
      create_posts
      expect(find_all('li.post').count).to be(2)
      expect(page).to have_content('0 Likes')
      first(:link, 'Like!').click
      expect(page).to have_content('1 Like')
    end
  end
end
