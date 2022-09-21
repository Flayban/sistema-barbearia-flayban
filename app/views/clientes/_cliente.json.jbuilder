json.extract! cliente, :id, :nome, :telefone, :email, :data_nascimento, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
