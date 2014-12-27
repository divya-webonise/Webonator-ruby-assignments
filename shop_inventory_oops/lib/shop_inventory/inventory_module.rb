# This module is about  searching products and list those products
module ShopInventoryModule
  def self.list_product
    inventory_file = File.open('../database/inventory.txt', 'r')
    puts 'List is as :'
    inventory_file.each_line do |line|
      split_line = line.split(',')
      puts '#{split_line[0]}\t\t#{split_line[1]}\t\t#{split_line[2]}\t\t#{split_line[3]}\t\t#{split_line[4]}'
    end
    inventory_file.close
  end

  def self.search_product
    print 'Enter the Product Name :'
    product_name = gets.chomp
    puts 'List is as :'
    search = /(\d+)\s+(#{product_name})\s+(\d+)\s+(\d+)\s+(\w+)\s*(?-i)/
    inventory_file = File.open('../database/inventory.txt', 'r')
    inventory_file.each_line { |line| puts line if line [search] }
    inventory_file.close
  end
end
