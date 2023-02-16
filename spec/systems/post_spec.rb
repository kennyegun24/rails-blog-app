# require 'rails_helper'

# RSpec.describe 'Posts', type: :system do
#   before do
#     driven_by(:rack_test)
#   end

#   describe 'Index' do
#     before(:all) do
#       @user = User.first
#       @posts = @user.posts.all
#     end

#     it 'I can see the user profile picture' do
#       visit user_posts_path(@user)
#       expect(page).to have_css("img[src*=\"#{@user.photo}\"]")
#     end

#     it 'I can see the username' do
#       visit user_posts_path(@user)
#       expect(page).to have_content(@user.name)
#     end

#     it 'I can see the number of posts the user has written' do
#       visit user_posts_path(@user)
#       expect(page).to have_content(@user.posts.count)
#     end

#     it 'I can see a post title' do
#       visit user_posts_path(@user)
#       @posts.each do |post|
#         expect(page).to have_text(post.text.slice(0, 80))
#       end
#     end

#     it 'I can see some of the post body' do
#       visit user_posts_path(@user)
#       @posts.each do |post|
#         expect(page).to have_content("#{post.text.slice(0, 80)}...")
#       end
#     end

#     it 'I can see how many comments a post has' do
#       visit user_posts_path(@user)
#       @posts.each do |post|
#         expect(page).to have_content(post.comments_counter)
#       end
#     end

#     it 'I can see how many likes a post has' do
#       visit user_posts_path(@user)
#       @posts.each do |post|
#         expect(page).to have_content(post.likes_counter)
#       end
#     end

#     it 'When I click on a post, it redirects me to that post show page' do
#       visit user_posts_path(@user)
#       post = @posts[0]
#       click_on post.title
#       expect(page).to have_current_path user_post_path(@user, post)
#     end

#     it 'I can see a section for pagination if there are more posts than fit on the view' do
#       visit user_posts_path(@user)
#       @posts.each do |post|
#         expect(page).to have_link(href: user_post_path(@user.id, post.id))
#       end
#     end
#   end

#   describe 'Show' do
#     before(:all) do
#       @user = User.first
#       @post = @user.posts.first
#     end

#     it 'I can see the post title' do
#       visit user_post_path(@user, @post)
#       expect(page).to have_content(@post.title)
#     end

#     it 'I can see the post body' do
#       visit user_post_path(@user, @post)
#       expect(page).to have_content(@post.text)
#     end

#     it 'I can see the username of the posts author' do
#       visit user_post_path(@user, @post)
#       expect(page).to have_content(@user.name)
#     end

#     it 'I can see how many comments it has' do
#       visit user_post_path(@user, @post)
#       expect(page).to have_content(@post.comments_counter)
#     end

#     it 'I can see how many likes it has' do
#       visit user_post_path(@user, @post)
#       expect(page).to have_content(@post.likes_counter)
#     end

#     it 'I can see the username of each commentor' do
#       visit user_post_path(@user, @post)
#       @post.comments.each do |comment|
#         expect(page).to have_content(comment.author.name)
#       end
#     end
#     it 'I can see the comment each commentor left' do
#       visit user_post_path(@user, @post)
#       @post.comments.each do |comment|
#         comments = comment.author.name
#         expect(page).to have_content(comments)
#       end
#     end
#   end
# end