class AppView < Vienna::View
  element '#todoapp'

  on :click, '#new_game' do
    new_game
  end


  def initialize
    @footer = Element.find '#footer'
    @game = Game.new(1)
    @player = Player.new(@game, 1)
    @cases = []
    3.times do |x|
      @cases[x] = []
      3.times do |y|
        add_case(x, y)
      end
    end
    self.element
    self.render
  end

  def add_case(x, y)
    view = CaseView.new(self, x, y)
    @cases[x][y] = view     
    view.render
    Element.find("#line_#{x}") << view.element
  end
  

  def play_turn(x, y)
    @game.place(x, y)
    @cases[x][y].element.html = "X"

    unless @game.finish?
      px, py = @player.play
      @cases[px][py].element.html = "O"
    end

    if @game.winner == -1
      Element.find("#result").html = "Game Lost"
    elsif @game.winner == 1
      Element.find("#result").html = "Game Won"
    end
  end
  
  def new_game
    @game = Game.new(1)
    @player = Player.new(@game, 1)
    3.times do |x|
      3.times do |y|
        @cases[x][y].element.html = ""
      end
    end
    Element.find("#result").html = "&nbsp;"
  end
  
  def render
  end

  def template
    Template['footer']
  end
end
