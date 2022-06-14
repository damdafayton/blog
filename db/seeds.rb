# require 'database_cleaner'

# DatabaseCleaner.clean_with(:truncation)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', photo: '', bio: 'Teacher from Mexico.', email: 'fake@fake.com', password:'123456')
second_user = User.create(name: 'Lilly', photo: '', bio: 'Teacher from Poland.', email: 'fake2@fake.com', password:'he1c314lli')
second_user = User.create(name: 'Markan', photo: '', bio: 'Runner from Thailand.', email: 'fake3@fake.com', password:'he1c314lli')

first_post = Post.create(author_id: first_user, title: 'How I started writing', text: 'This is my first post')
Post.create(author_id: first_user.id, title: 'Advantages of walking', text: 'This is my post_2')
Post.create(author_id: first_user.id, title: 'Come run with me', text: 'This is my post_3')
Post.create(author_id: first_user.id, title: 'It was the best Friday', text: 'This is my post_4')
last_post_first_user = Post.create(author_id: first_user.id, title: 'This is my first blog', text: 'This my nice first post')
last_post_second_user = Post.create(author_id: second_user.id, title: 'Why did I write this blog?', text: 'This is my last post')

Comment.create(post_id: last_post_first_user.id, author_id: second_user.id, text: 'Hi Tom this is a comment!' )
Comment.create(post_id: last_post_first_user.id, author_id: second_user.id, text: 'Hi Tom this is another comment!' )
Comment.create(post_id: last_post_first_user.id, author_id: second_user.id, text: 'Hi Tom this is the bes comment!' )
Comment.create(post_id: last_post_second_user.id, author_id: second_user.id, text: 'Hi Tom this is bad comment!' )
Comment.create(post_id: last_post_second_user.id, author_id: second_user.id, text: 'Hi Tom this is worse comment!' )
Comment.create(post_id: last_post_second_user.id, author_id: second_user.id, text: 'Hi Tom this is the worst comment!' )
