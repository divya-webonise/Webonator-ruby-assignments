# This module is about selecting user type
require 'shop_inventory/order'
require 'shop_inventory/product'
require 'shop_inventory/version'
# According to the user type being selected the corressponding functionalities would be provided
class UserAccess
  def user_type
    puts 'Are you a customer or a shopkeeper?'
    user = { 1 => 'you are Customer', 2 => 'you are Shopkeeper' }
    user.default = 'Wrong choice'
    puts user
    puts 'Select your choice'
    choice = gets.to_i
    puts user[choice]
    if choice == 1
      order_obj = Order.new
      order_obj.order_menu
    elsif choice == 2
      product_obj = Product.new
      product_obj.product_menu
    else
      puts 'You have entered a wrong choice..!'
    end
  end
end
