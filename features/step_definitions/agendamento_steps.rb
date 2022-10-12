Given('existe um servico com os dados nome {string} valor {string} e tempo {string}') do |nome, valor ,tempo|
  visit '/services/new'
  expect(page).to have_current_path('/services/new')

  fill_in 'service[nome]', :with => nome
  fill_in 'service[valor]', :with => valor
  fill_in 'service[tempo]', :with => tempo

  click_button 'Create Service'
end

When('existe um barbeiro com os dados nome {string} telefone {string} data_nascimento {string} email {string} password {string}') do |nome, telefone, data_nascimento, email, password|
  visit '/barbeiros/sign_up'
  expect(page).to have_current_path('/barbeiros/sign_up')

  fill_in 'barbeiro[nome]', :with => nome
  fill_in 'barbeiro[telefone]', :with => telefone
  fill_in 'barbeiro[data_nascimento]', :with => data_nascimento
  fill_in 'barbeiro[email]', :with => email
  fill_in 'barbeiro[password]', :with => password
  fill_in 'barbeiro[password_confirmation]', :with => password

  click_button 'Sign up'

  click_button 'Sair'
end

When('existe um cliente com os dados nome {string} telefone {string} data_nascimento {string} email {string} password {string}') do |nome, telefone, data_nascimento, email, senha|
  visit '/clientes/sign_up'
  expect(page).to have_current_path('/clientes/sign_up')

  fill_in 'cliente[nome]', :with => nome
  fill_in 'cliente[telefone]', :with => telefone
  fill_in 'cliente[data_nascimento]', :with => data_nascimento
  fill_in 'cliente[email]', :with => email
  fill_in 'cliente[password]', :with => senha
  fill_in 'cliente[password_confirmation]', :with => senha

  click_button 'Sign up'
end

When('eu estou na pagina de clientes e clico no cliente') do
  click_on 'Agendamento'
end

When('eu seleciono o barbeiro {string} o servico {string} e o inicioAtendimento {string}') do |barbeiro, servico, inicioAtendimento|
  select barbeiro, :from => 'agendamento_barbeiro_id'
  select servico, :from => 'agendamento_service_id'
  fill_in 'agendamento_inicioAtendimento', with:  inicioAtendimento
end

When('eu clico em Create Agendamento') do
  click_button 'Create Agendamento'
end

Then('eu vejo uma mensagem de confirmacao do sistema {string}') do |text|
  page.has_text?(text)
end

When('eu seleciono o barbeiro {string} e o inicioAtendimento {string}') do |barbeiro, inicioAtendimento|
  select barbeiro, :from => 'agendamento_barbeiro_id'
  fill_in 'agendamento_inicioAtendimento', with:  inicioAtendimento
end

Then('eu vejo uma mensagem de erro {string}') do |text|
  page.has_text?(text)
end

