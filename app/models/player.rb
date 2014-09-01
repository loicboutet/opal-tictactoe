class Player
  def initialize(game, number)
    @game = game
    @number = number
  end

  def my_turn?
    @number == @game.next
  end

  def play
    if @game.empty?
      @game.place(1, 1) 
      return 1, 1
    else
      cell = @game.empty_cells.first
      @game.place(cell[0], cell[1]) 
      return cell[0], cell[1]
    end
  end
end