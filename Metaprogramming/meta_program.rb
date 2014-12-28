require 'csv'
class MetaProgram
  def file_name
    puts "Enter the input file"
    file_input = gets.chomp
    #input = file_input.dup.split(/_/).map{ |word| word.capitalize }.join('')
    class_name = File.basename(file_input,".csv").split(/_/).map{ |word| word.capitalize }.join('')
    puts class_name
    #w=class_name.split()
    klass = Object.const_set(class_name,Class.new)
    puts "class name is :#{klass}"
    file = File.open( file_input)
    header = file.gets.chomp
    names = header.split(",")
    puts "headers are:#{names}"


    klass.class_eval do
      attr_accessor *names
      define_method(:initialize) do |*values|
        names.each_with_index do |name,i|
          instance_variable_set("@#{name}", values[i])
        end
      end
    end
  end
end

meta=MetaProgram.new()
meta.file_name





