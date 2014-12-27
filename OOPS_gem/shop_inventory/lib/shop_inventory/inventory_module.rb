module ShopInventoryModule
  def ShopInventoryModule.list_product
    inventory_file=File.open("database/inventory.txt", "r")
    puts "List is as :"
    #puts "Product_id\tProduct_Name\tPrice\tStock_Item\tCompany_Name "
    inventory_file.each_line do |line|
      split_line= line.split(",")
      puts "#{split_line[0]}\t\t#{split_line[1]}\t\t#{split_line[2]}\t\t#{split_line[3]}\t\t#{split_line[4]}"
    end
    inventory_file.close
  end

  def ShopInventoryModule.search_product
      print "Enter the Product Name :"
      product_name=gets.chomp
      puts "List is as :"
      #puts "Product_id\tProduct_Name\tPrice\tStock_Item\tCompany_Name "
      search = /(\d+)\s+(#{product_name})\s+(\d+)\s+(\d+)\s+(\w+)\s*(?-i)/
      inventory_file=File.open("database/inventory.txt","r")
      # puts inventory_file
      #  search = /\d+\t+\w*#{product_name}\w*\t+\d+\t+\d+\t+\w+\t*/.match(inventory_file)
      # puts search
      inventory_file.each_line { |line| puts line if line [search]}
      inventory_file.close
      #search_product
  end
end