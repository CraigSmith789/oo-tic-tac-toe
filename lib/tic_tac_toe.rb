class TicTacToe
WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
]
    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        index = input.to_i
        index - 1
    end

    def move (index, token = "X")
        @board[index] = token
        display_board
    end

    def position_taken?(index)
         if (@board[index] == " " || @board[index] == "" || @board[index] = nil)
         false
         else 
            true
         end
    end
    def valid_move?(index)
        if(index.between?(0, 8 ) && position_taken?(index) == false)
          return true
        else
          return false
          end
        end
        
    def turn_count
        counter = 0
        @board.each do |move|
          if move == "O"|| move == "X"
             counter += 1
          end
        end
        counter
    end

    def current_player
        if turn_count % 2 == 0
           "X"
        else  "O"
        end
      end
    def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
    
        if valid_move?(index) == true
            token = current_player
        move(index, token)
    
        else turn
        end
    end
     
    def won?

        WIN_COMBINATIONS.each do |win_combination|
      
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]
      
        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]
      
        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return win_combination
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
        end
      end
        return false
      end
    def full?
        @board.all?{|i| i != " " }         
               
    end 

      def draw? 
        full? && !won?
        
      end
      
      
      def over? 
        if won? != false || draw? == true || full? == true
          return true
         else
            return false
         end
      end
      
      def winner
      the_winner = won?
        if the_winner == false
          return nil
        else
          return @board[the_winner[1]]
        end
      end
      
      def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
      end
 end
