class Knight
  attr_reader:move,:row,:column
  LEGAL_STEPS = [ [-2,  1], [-1,  2], [ 1,  2], [ 2,  1],
                   [ 2, -1], [ 1, -2], [-1, -2], [-2, -1] ]
  def board_size
    puts 'Enter a row'
    @row = gets.to_i
    puts 'Enter a column'
    @column = gets.to_i
    puts 'your chess board size  is of: '+row.to_s+' by '+column.to_s
    size_of_chess = row*column
    @chess_board = Array.new(row){Array.new(column) }
    @chess_board[0][0] = 0
    puts @chess_board
    @x_current_position = 0
    @y_current_position = 0
    @current_node = [ @x_current_position,@y_current_position]
    puts "Current node is:"
    puts @current_node
    @moves=size_of_chess-1
    puts'The no. of moves will be:'
    puts @moves
    @moves.times do
      find_next_node(@current_node,@x_current_position,@y_current_position)
    end
  end
  def find_next_node(current_node,x_current_position,y_current_position)
    h= {}
    LEGAL_STEPS.each do |move|
      x = current_node[0] + move[0]
      y = current_node[1] + move[1]
      if legal_move?(x,y)
        if !visited_node?([x,y])
          @neighbour_node = [x,y]
          puts @neighbour_node
          @counter = 0
          find_next_neighbour_node(@neighbour_node,@counter)
          h[[x,y]] = @counter
          puts h
          key, value = h.min_by{|k,v| v}
          puts "#{key} is the next selected node"
          #move_grid(key)\
          new_x_current_position = key[0]+@x_current_position
          new_y_current_position = key[1]+@y_current_position
          @current_node = [new_x_current_position,new_y_current_position]
        end
      end
    end
  end
  def find_next_neighbour_node(neighbour_node,counter)
    LEGAL_STEPS.each do |move|
      x1 = neighbour_node[0]+ move[0]
      y1 = neighbour_node[1]+ move[1]
      if legal_move?(x1,y1)
        if !visited_node?([x1,y1])
          puts " corresponding child Neighbour Node : #{[x1,y1]}"
          @counter += 1
        end
      end
    end
  end
   def legal_move?(x_coordinate,y_coordinate)
    ((x_coordinate >= 0 && x_coordinate <= @row) && (y_coordinate >= 0 && y_coordinate <= @column))
  end
  def visited_node?(current_node)
    !@chess_board[current_node[0]][current_node[1]].nil?
  end
end
knight = Knight .new
knight.board_size
