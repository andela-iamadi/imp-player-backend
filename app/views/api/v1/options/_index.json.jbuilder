if options
  json.options options, partial: 'api/v1/options/show.json', as: :option
else
  json.error 'No options exist for this question'
end