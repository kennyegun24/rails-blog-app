# require 'rails_helper'

# RSpec.describe 'Users', type: :system do
#   before do
#     driven_by(:rack_test)
#   end

#   describe 'Index' do
#     before(:all) do
#       @users = User.limit(5)
#     end

#     it 'shows all the properties (Name, photo, number of posts) of each user' do
#       visit users_path

#       @users.each do |user|
#         expect(page).to have_text(user.Name)
#         # expect(page).to have_css("img[src*=\"#{user.photo}\"]")
#         expect(page).to have_text(user.PostCounter)
#         expect(page).to have_link(href: user_path(user))
#       end
#     end

# #     it 'redirects to user show page when clicking the user card' do
# #       visit users_path

# #       user = @users[0]
# #       click_on user.Name

# #       expect(page).to have_current_path user_path(user)
# #     end
# #   end

# #   describe 'Show' do
# #     before(:all) do
# #       @user = User.first
# #     end

# #     it 'I can see the user\'s profile picture.' do
# #       visit(user_path(@user))
# #       expect(page).to have_css("img[src*=\"#{@user.photo}\"]")
# #     end

# #     it 'I can see the user\'s userName.' do
# #       visit(user_path(@user))
# #       expect(page).to have_content(@user.posts.count)
# #     end

# #     it 'I can see the number of posts the user has written.' do
# #       visit(user_path(@user))

# #       expect(page).to have_content(@user.Name)
# #     end

# #     it 'I can see the user\'s Bio.' do
# #       visit(user_path(@user))

# #       expect(page).to have_text(@user.Bio)
# #     end

# #     it 'I can see the user\'s first 3 posts.' do
# #       visit(user_path(@user))

# #       @user.recent_posts.each do |post|
# #         expect(page).to have_text(post.text.slice(0, 80))
# #         expect(page).to have_link(href: user_post_path(@user.id, post.id))
# #       end
# #     end

# #     it 'I can see a button that lets me view all of a user\'s posts.' do
# #       visit(user_path(@user))

# #       expect(page).to have_link(href: user_posts_path(@user))
# #     end

# #     it 'When I click a user\'s post, it redirects me to that \'s show page.' do
# #       visit(user_path(@user))

# #       post = @user.recent_posts[0]
# #       click_on post.title

# #       expect(page).to have_current_path user_post_path(@user, post)
# #     end

# #     it 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do
# #       visit(user_path(@user))

# #       click_on 'See all posts'

# #       expect(page).to have_current_path user_posts_path(@user)
# #     end
# #   end
# end