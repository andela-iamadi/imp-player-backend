class Api::V1::QuestionsController < Api::V1::BaseController
  def index
    @questions = Question.all
    render json: @questions
  end

  def next
    question = Question.find_by(id: params[:question_id])
    next_question = question ? question.next : Question.first
    render partial: 'api/v1/questions/show.json', locals: { question: (next_question || question)}
  end

  def previous
    question = Question.find_by(id: params[:question_id])
    previous_question = question ? question.previous : Question.last
    render partial: 'api/v1/questions/show.json', locals: { question: (previous_question || question)}
  end
end