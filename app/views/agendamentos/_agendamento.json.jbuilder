json.extract! agendamento, :id, :horario, :created_at, :updated_at
json.url agendamento_url(agendamento, format: :json)
