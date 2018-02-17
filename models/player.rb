require "./db"

class Player
  attr_reader :score

  def initialize(name)
    @score = 0
    @name = name
  end

  def updateScore(num)
    @score = num + @score

    if @score < 0
      @score = 0
    end
  end

  # save player to db
end
