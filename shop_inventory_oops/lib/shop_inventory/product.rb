require './shop_inventory/inventory_module.rb'
# This class is accessed by shopkeeper
# Shopkeeper can add product,list product,search specific product
# He can ,edit product,remove product
class Product
  include ShopInventoryModule
  def initialize
    @product_id = 0
  end

  def product_menu
    answer = 'y'
    while answer == 'y' || answer == 'Y'
      puts '1. Add Product'
      puts '2. Remove Product'
      puts '3. List all products'
      puts '4. Search Product by name'
      puts '5. Edit Product details'
      puts 'Select any option(1-5)'
      option = gets.chomp
      option = Integer(option)
      if (option == 1)
        add_product
      elsif (option == 2)
        remove_product
      elsif (option == 3)
        ShopInventoryModule.list_product
      elsif (option == 4)
        ShopInventoryModule.search_product
      elsif (option == 5)
        edit_product_details
      else
        puts 'You have enterted the wrong choice'
      end
      puts 'Do you want to select options again from menu?(Y/N)'
      answer = gets.chomp
    end
  end
  def add_product
    @product_id += 1
    puts @product_id
    puts 'Enter the Product Name :'
    @product_name = gets.chomp
    puts 'Enter the Price :'
    @price = gets.chomp
    puts 'Enter the Stock Item :'
    @stock_item = gets.chomp
    puts 'Enter the company name :'
    @company_name = gets.chomp

    inventory_file = File.new('../database/inventory.txt', 'a+')

    if inventory_file
      inventory_file.puts "#{@product_id}\s#{@product_name}\s#{@price}\s#{@stock_item}\s#{@company_name}"
    else
      puts 'Unable to open file'
    end
    inventory_file.close
  end
  def remove_product
    print 'Enter the product_id to remove Product :'
    product_id = gets.chomp
    inventory_file = File.read('../database/inventory.txt')
    re = /#{product_id}\s+(\w+)\s+(\d+)\s+(\d+)\s+(\w+)\s*/
    remove = inventory_file.gsub(re, '')
    puts remove
    File.open('../database/inventory.txt', 'w') { |file| file.puts remove }
  end

  def edit_product_details
    puts 'Enter the product_id to edit its details'
    product_id = gets.chomp
    puts 'Enter the Product Name :'
    product_name = gets.chomp
    puts 'Enter the Price :'
    price = gets.chomp
    puts 'Enter the Stock Item :'
    stock_item = gets.chomp
    puts 'Enter the company name :'
    company_name = gets.chomp
    inventory_file = File.read('../database/inventory.txt')
    re = /#{product_id}\s+(\w+)\s+(\d+)\s+(\d+)\s+(\w+)\s*/
    remove = inventory_file.gsub(re, '#{product_id}\s#{product_name}\s#{Price}\s#{stock_item}\s#{company_name}')
    puts remove
    puts "#{product_id}\s#{product_name}\s#{price}\s#{stock_item}\s#{company_name}"
    File.open('../database/inventory.txt', 'w') { |file| file.puts remove }
  end
end


