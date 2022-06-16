# require 'database_cleaner'

# DatabaseCleaner.clean_with(:truncation)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', email: 'fake1@fake.com', password:'123456')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.', email: 'fake2@fake.com', password:'he1c314lli')


first_post = Post.create(author_id: first_user, title: 'Hello', text: 'This is my first post')
Post.create(author_id: first_user.id, title: 'Hello2', text: 'This is my post_2')

Post.create(author_id: first_user.id, title: 'Hello3', text: 'This is my post_3')
Post.create(author_id: first_user.id, title: 'Hello4', text: 'This is my post_4')
last_post_first_user = Post.create(author_id: first_user.id, title: 'POST TITLE', text: 'This my nice first post')
last_post_second_user = Post.create(author_id: second_user.id, title: 'SECOND POST TITLE', text: 'This is my last post')

Comment.create(post_id: last_post_first_user.id, author_id: second_user.id, text: 'Hi Tom this is a comment!' )
Comment.create(post_id: last_post_first_user.id, author_id: second_user.id, text: 'Hi Tom this is a comment!' )
Comment.create(post_id: last_post_first_user.id, author_id: second_user.id, text: 'Hi Tom this is a comment!' )
Comment.create(post_id: last_post_second_user.id, author_id: second_user.id, text: 'Hi Tom this is a comment!' )
Comment.create(post_id: last_post_second_user.id, author_id: second_user.id, text: 'Hi Tom this is a comment!' )
Comment.create(post_id: last_post_second_user.id, author_id: second_user.id, text: 'Hi Tom this is my comment!' )
