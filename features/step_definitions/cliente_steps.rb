#primeiro cenário
Given('estou na pagina para criar um cliente') do
  visit '/clientes/sign_up'
  expect(page).to have_current_path('/clientes/sign_up')
end

When('eu preencho os dados nome {string}  telefone {string} data_nascimento {string} email {string}  password {string}') do |nome, telefone, data_nascimento, email, senha|
  fill_in 'cliente[nome]', :with => nome
  fill_in 'cliente[telefone]', :with => telefone
  fill_in 'cliente[data_nascimento]', :with => data_nascimento
  fill_in 'cliente[email]', :with => email
  fill_in 'cliente[password]', :with => senha
  fill_in 'cliente[password_confirmation]', :with => senha
end

When('entao eu clico no botão Sign up') do
  click_button 'Sign up'
end

Then('eu vejo a pagina inicial dos clientes') do
  visit '/'
  expect(page).to have_current_path('/')
end

#segundo cenário

Then('eu vejo a mensagem que deve existir um @ no endereco de email') do
  expect(page).to have_content('Email is invalid')
end

#terceiro cenário
Given('estou na pagina de login do cliente') do
  visit '/clientes/sign_in'
  expect(page).to have_current_path('/clientes/sign_in')
end

When('entao eu preencho os campos de email {string} password {string}') do |email, senha|
  fill_in 'cliente[email]', :with => email
  fill_in 'cliente[password]', :with => senha
end

When('clico no botao Log in') do
  click_button 'Log in'
end

#quarto cenário
Then('eu vejo a mensagem que a senha e muito pequena') do
  expect(page).to have_content('Password is too short (minimum is 6 characters)')
end

#quinto cenário
Then('eu vejo a mensagem que a data de nascimento e invalida') do
  expect(page).to have_content('Data nascimento : Data de nascimento invalida')
end



