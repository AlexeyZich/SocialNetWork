# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.find_by(email: 'admin@example.com')
test = User.find_by(email: 'test@example.com')
u1 = User.find_by(email: 'kolya@example.com')

User.create(email: 'admin@example.com', password: '12345678', name: 'Саша') if admin.blank?
User.create(email: 'test@example.com', password: '12345678', name: 'Вася') if test.blank?
User.create(email: 'kolya@example.com', password: '12345678', name: 'Коля') if u1.blank?

if FriendRequest.count == 0
  FriendRequest.create(sender: test, recipient: admin)
  FriendRequest.create(sender: admin, recipient: u1)
end
