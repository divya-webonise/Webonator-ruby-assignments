require 'active_record'
require 'sqlite3'
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'user_information_app.db'
)
ActiveRecord::Schema.define do
  create_table :people do |t|
    t.string :name
    t.string :email
    t.string :type
  end
  create_table :posts do |t|
    t.string :content
    t.text :description
    t.integer :user_id
  end
  create_table :accounts do |t|
    t.integer :admin_id
    t.string :account_no
  end
end
class Person < ActiveRecord::Base
end
# The user class inherits person
class User < Person
  has_many :posts
end
# The admin class inherits person
class Admin < Person
  has_many :accounts
end
# The post class here have belong to  relationship with users
class Post < ActiveRecord::Base
  belongs_to :user
end
# The post class here have belong to  relationship with admin
class Account < ActiveRecord::Base
  belongs_to :admin
end

person_user_one = Person.create(name: 'divya', email: 'dvsharma@weboniselab.com', type: 'User')
person_user_two = Person.create(name: 'ash', email: 'ash@weboniselab.com', type: 'User')
user_one = User.create(name: 'ansh', email: 'ansh67@gmail.com', type: 'User')
post_one = Post.new(content:  'nyc pic', description:  'pic is nice but your manali photos were awesome')
post_two = Post.new(content: 'hey,where are u now dayz', description: 'By the way our annual meet will gonna start soon')
post_three = Post.new(content: 'mast mast pic', description: 'how is your studies going on!')
post_one.user = person_user_one
post_two.user = user_one
post_three.user = person_user_two
post_one.save
post_two.save
post_three.save
person_user_three = Person.create(name: 'tanvi', email: 'tanvi@weboniselab.com', type: 'Admin')
admin_one = Admin.create(name: 'anshi', email:  'anshi123@weboniselab.com', type: 'Admin')
account_one = Account.new(account_no: '1234')
account_two = Account.new(account_no: '4578')
account_one.admin = person_user_three
account_two.admin = admin_one
account_one.save
account_two.save
puts person_user_one.inspect
puts person_user_two.inspect
puts person_user_three.inspect
puts user_one.inspect
puts post_one.inspect
puts post_two.inspect
puts post_three.inspect
puts person_user_three.inspect
puts admin_one.inspect
puts account_one.inspect
puts account_two.inspect
