require "./models/player"
require "./db"

class Game
  attr_accessor :player

  # create_table("words")

  def initialize(name)
    @answer_abc_placeholder = ["a.)","b.)","c.)","d.)"]
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

    @answer = retrieve_question_data( next_question_number )

    @current_question_list = @answer["options"].delete("{}").split(',').push( @answer["name"] ).shuffle!

    answer_list = @current_question_list.map.with_index do |answer,index|
      @answer_abc_placeholder[index] + answer
    end

    question_display = <<QUESTION
......Question.....

#{@answer["definition"]}

....Answers.....

#{answer_list.join("\n")}

QUESTION
  print question_display
  end

  def answer_question(answer)
    answer_index_arr = @answer_abc_placeholder.map do |x|
      x.match(/\w+/).to_s
    end

    index = answer_index_arr.index(answer)

    return "invalid" if index < 0
    # save to db self.player.score
    points = check_answer?(index) ? 1 : -1

    print "points: #{points}"

    @player.updateScore(points)

    show_question()
  end


  def check_answer?(index)
    (@answer["name"] === @current_question_list[index] ) ? true : false
  end

  # private :check_answer?, :show_question
end

