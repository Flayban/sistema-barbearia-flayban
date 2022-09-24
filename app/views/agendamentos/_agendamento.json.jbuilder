json.extract! agendamento, :id, :inicioAtendimento, :fimAtendimento, :created_at, :updated_at
json.url agendamento_url(agendamento, format: :json)
