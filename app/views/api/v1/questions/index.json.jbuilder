json.questions(@questions) do |question|
  json.id question.id
  json.text question.text
  json.answer question.answer
end

json.you do
  json.id current_user&.id
  json.name current_user&.name
end
