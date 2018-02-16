require "../db"

class Player
  attr_reader :score

  def initailize(name)
    @score = 0
    @name = name
  end

  # save player to db
end
