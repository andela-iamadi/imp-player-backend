question ||= @question
options ||= question.options

if question
  json.(question, :id, :content, :created_at, :updated_at)
  json.partial! 'api/v1/options/index.json', options: options
else
  json.error "question doesn't exist"
end
