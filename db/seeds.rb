# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

questions = [
  'What happens when no one ask a question?',
  'Who made all the questions not very possible?',
  'Why is the grass green?'
]

questions.each do |content|
  q = Question.create(content: content)

  options = 4.times.map do
    q.options.create(content: Faker::Lorem.sentence)
  end

  rand = Faker::Number.rand_in_range(0, 3)
  q.correct_options.create(option_id: options[rand].id)
endexit