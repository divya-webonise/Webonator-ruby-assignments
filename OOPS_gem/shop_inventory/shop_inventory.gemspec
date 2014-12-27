require './lib/shop_inventory/version'
# Tis gives information about gem version we are using
# It also gives information about author ,files,name.

Gem::Specification.new do |s|
  s.name        = 'shop_inventory'
  s.version     =  ShopInventory::VERSION
  s.date        = '2014-12-25'
  s.email       = 'divya.sharma@weboniselab.com'
  s.summary     = 'This gem is about Shop inventory'
  s.description = "Shop Inventory Gem for:- 1. customer to a)buy product ,b)list all products c)search product. 2. ShopKeeper a)add products b)   edit products c) search products d)list all the products e)remove particular product"
  s.author      = ["Divya Sharma"]
  s.files       = ["lib/shop_inventory.rb","lib/user_access.rb","lib/shop_inventory/version.rb","lib/shop_inventory/order.rb","lib/shop_inventory/product.rb","lib/shop_inventory/inventory_module.rb"]
  s.executables = ["shop_inventory"]
end
