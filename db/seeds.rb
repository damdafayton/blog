# require 'database_cleaner'

# DatabaseCleaner.clean_with(:truncation)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', email: 'fake1@fake.com', password:'hel2131cli')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.', email: 'fake2@fake.com', password:'he1c314lli')

first_post = Post.create(author_id: first_user, title: 'Hello', text: 'This is my first post')
Post.create(author_id: first_user, title: 'Hello2', text: 'This is my first post_2')
Post.create(author_id: first_user, title: 'Hello3', text: 'This is my first post_3')
Post.create(author_id: first_user, title: 'Hello4', text: 'This is my first post_4')
Post.create(author_id: second_user, title: 'Hello', text: 'This is my first post')
Post.create(author_id: 1, title: 'Hi 1', text: 'This is my first post')
Post.create(author_id: 1, title: 'Hi 2', text: 'This is my second post')

Comment.create(post_id: first_post, author_id: second_user, text: 'Hi Tom!' )
Comment.create(post_id: first_post, author_id: second_user, text: 'Hi Tom!' )
Comment.create(post_id: first_post, author_id: second_user, text: 'Hi Tom!' )
Comment.create(post_id: first_post, author_id: second_user, text: 'Hi Tom!' )
Comment.create(post_id: first_post, author_id: second_user, text: 'Hi Tom!' )
Comment.create(post_id: first_post, author_id: second_user, text: 'Hi Tom!' )
