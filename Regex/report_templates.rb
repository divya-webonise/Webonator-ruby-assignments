require 'csv'

report_input_file=File.read("report_templates.html")
heading=report_input_file.scan(/(?:<[\/]*th>)([\w|\s]+)(?:&quot;)*/)
data=report_input_file.scan(/(?:<tr><td>)(\d+)(?:<\/td>)(?:<td>)(\d+)(?:<\/td>)(?:<td>)(\d+)(?:<\/td>)(?:<td>)(\d+\.\d+)(?:<\/td>)*(?:<td>)([\w|\s|\.|\,|\-|!|\(|\)]+)(?:<\/td>)(?:<td>)([\w|\s|\.|\,|\-|\!|\(|\)]*)(?:<\/td>)/)
puts heading
puts data
csv=CSV.open("report_template_file.csv","w")
csv<<heading.flatten
data.each{|n| csv<<n}
csv.close


