require "./models/player"

class Game
  attr_accessor :player

  def initialize(name)
    @player = Player.new(name)
    question_length = get_questions_length()
    @queue = (0...question_length).to_a.shuffle


    show_question()
  end

  def show_question
    # take off next question from our list
    # to prevent duplicate questions
    next_question_number = @queue.pop

    question_data = retrieve_question_data( next_question_number )

    question_display = <<QUESTION
......Question.....

${question.definition}

....Answers.....


QUESTION


  end

  def answer_question(answer)
    # save to db self.player.score
    check_answer
  end


  def check_answer

  end

  private :check_answer
end


# new_game = Game.new()

# new_game.check_answer
