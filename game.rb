require "./models/player"
require "./db"

class Game
  attr_accessor :player

  create_table("words")

  def initialize(name)
    @answer_abc_placeholder = ["a","b","c","d"]
    @current_question_list = []
    @answer = nil
    @player = Player.new(name)

    question_length = get_questions_length()

    @queue = (0...question_length).to_a.shuffle

    show_question()
  end

  def show_question
    # take off next question from our list
    # to prevent duplicate questions
    next_question_number = @queue.pop

    if !next_question_number
      return %Q{
    .....GAME OVER .....

******************************
YOUR SCORE: #{@player.score}
******************************
}
    end

    @answer = retrieve_question_data( next_question_number )

    @current_question_list = @answer["options"].delete("{}").split(',').push( @answer["name"] ).shuffle!

    answer_list = @current_question_list.map.with_index do |answer,index|
      "#{@answer_abc_placeholder[index]}.) #{answer}"
    end

    question_display = <<QUESTION
......Question.....

#{@answer["definition"]}

....Answers.....

#{answer_list.join("\n")}

QUESTION
  print question_display
  end

  def answer_question(answer="")
    index = @answer_abc_placeholder.index(answer)

    if index < 0
      p "\ninvalid answer. Please try again\n"
      return
    end
    # save to db self.player.score
    is_correct = check_answer?(index)
    points = is_correct ? 1 : -1

    if is_correct
      p "\nYou are correct!!!\n"
    else
      p "\nWrong answer\n"
    end

    print "points from round: #{points}\n"

    @player.updateScore(points)

    show_question()
  end


  def check_answer?(index)
    (@answer["name"] === @current_question_list[index] ) ? true : false
  end

  # private :check_answer?, :show_question
end

