require "./models/player"

class Game
  attr_accessor :player

  @answer_abc_placeholder = ["a.)","b.)","c.)","d.)"]
  @current_question_list = []

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

    answer_list = question_data.options.delete("{}").split(',').push( question_data.name ).shuffle!

    @current_question_list = answer_list.concat

    answer_list = answer_list.map.with_index do |answer,index|
      @answer_abc_placeholder[index] + answer
    end

    question_display = <<QUESTION
......Question.....

${question.definition}

....Answers.....

#{answer_list.join("\n")}

QUESTION


  end

  def answer_question(answer)
    answer_index_arr = @answer_abc_placeholder.map do |x|
      x.match(/\w+/).to_s
    end

    index = answer_index_arr.index(answer)

    return "game over" if index < 0
    # save to db self.player.score
    check_answer(index)
  end


  def check_answer(index)

  end

  private :check_answer
end


# new_game = Game.new()

# new_game.check_answer
