# This program is of metaprogramming
# Here headers are taken as attribute
#Rows are taken as objects of that attribute
require 'csv'
class Meta
  def file_name
    puts 'Enter the input file'
    file_input = gets.chomp
    class_name = File.basename(file_input, '.csv').split(/_/).map{|word| word.capitalize }.join('')
    puts class_name
    klass = Object.const_set(class_name,Class.new)
    puts 'class name is :#{klass}'
    CSV.foreach(file_input, headers: true, header_converters: :symbol) do |content|
      kclass = klass.new
      content.each do|names,values|
        klass.class_eval { attr_accessor :names}
        kclass .instance_variable_set("@#{names}", values)
      end
      puts kclass.inspect
    end
  end
end

meta=Meta.new
meta.file_name
