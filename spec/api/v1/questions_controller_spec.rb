require 'spec_helper'

describe Api::V1::QuestionsController, type: :controller do
  render_views

  let!(:questions) { 3.times.map { create(:question, :with_options) } }

  describe 'GET /api/v1/questions' do
    it 'returns a list of questions' do
      get :index
      expect(JSON.parse(response.body)).to eq JSON.parse(questions.to_json)
    end
  end

  describe 'GET /api/v1/:id/next'do
    it 'returns the first record in the questions record if an invalid id is supplied' do
      get :next, question_id: 0
      expect(JSON.parse(response.body)['id']).to eq Question.first.id
    end

    it 'returns the next record in the questions table if a valid id is supplied' do
      get :next, question_id: questions[0].id

      second_question = Question.first(2).last
      expect(JSON.parse(response.body)['id']).to eq second_question.id
    end

    it 'returns the same question if it is the last question in the table' do
      last_question = questions[2]
      get :next, question_id: last_question.id
      expect(JSON.parse(response.body)['id']).to eq last_question.id
    end

    it 'returns the question with the options nested' do
      get :next, question_id: 0
      expect(JSON.parse(response.body)['options']).to eq JSON.parse(questions[0].options.to_json)
    end
  end

  describe 'GET /api/v1/:id/previous (#previous)'do
    it 'returns the last record in the questions table if an invalid id is supplied' do
      get :previous, question_id: 0
      expect(JSON.parse(response.body)['id']).to eq Question.last.id
    end

    it 'returns the previous record in the questions record if a valid id is supplied' do
      get :next, question_id: questions[0].id

      previous_question = Question.first(2).last
      expect(JSON.parse(response.body)['id']).to eq previous_question.id
    end

    it 'returns the same question if it is the first question in the table' do
      first_question = questions[0]
      get :first, question_id: first_question.id
      expect(JSON.parse(response.body)['id']).to eq first_question.id
    end

    it 'returns the question with the options nested' do
      get :previous, question_id: 0
      expect(JSON.parse(response.body)['options']).to eq JSON.parse(questions[2].options.to_json)
    end
  end
end