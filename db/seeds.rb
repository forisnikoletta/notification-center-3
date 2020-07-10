# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# 	Ex: 
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Notification.create(title: 'title 1', body: 'body 1', user_id: '2')
Notification.create(title: 'title 2', body: 'body 2', user_id: '3')
Notification.create(title: 'title 3', body: 'body 3', user_id: '2')
Notification.create(title: 'title 4', body: 'body 4', user_id: '2')
Notification.create(title: 'title 5', body: 'body 5', user_id: '4')
Notification.create(title: 'title 6', body: 'body 6', user_id: '3')
Notification.create(title: 'title 7', body: 'body 7', user_id: '3')
Notification.create(title: 'title 8', body: 'body 8', user_id: '2')
Notification.create(title: 'title 9', body: 'body 9', user_id: '2')
Notification.create(title: 'title 10', body: 'body 10', user_id: '2')

User.create(email: "admin@mail.com", password: "123456", password_confirmation: "123456")
User.create(email: "client1@mail.com", password: "123456", password_confirmation: "123456")
User.create(email: "client2@mail.com", password: "123456", password_confirmation: "123456")
User.create(email: "client3@mail.com", password: "123456", password_confirmation: "123456")
