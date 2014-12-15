require 'matrix'

	puts "Enter the rows of chess board"
	row=gets.to_i
	puts "Enter the column of chess board"
	column=gets.to_i
	puts "your chess board size  is of: "+row.to_s+" by "+column.to_s
	size_of_chess=row*column
	puts"The no. of moves will be:"
	move=size_of_chess-1
	puts move
	m=Matrix.build(row,column){|row,column|0-2}
	puts m
	m.send(:[]=,0,0,0)
	puts m
	
	

	#empty_table.at(0)

	
