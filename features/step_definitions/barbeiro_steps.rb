##Scenario 1
Given('estou na pagina para criar um barbeiro') do
  visit '/barbeiros/sign_up'
  expect(page).to have_current_path('/barbeiros/sign_up')
end

When('eu preencho os dados de nome {string} telefone {string} data_nascimento {string} email {string} password {string}') do |nome, telefone, email, data_nascimento, senha|
  fill_in 'barbeiro[nome]', :with => nome
  fill_in 'barbeiro[telefone]', :with => telefone
  fill_in 'barbeiro[data_nascimento]', :with => data_nascimento
  fill_in 'barbeiro[email]', :with => email
  fill_in 'barbeiro[password]', :with => senha
  fill_in 'barbeiro[password_confirmation]', :with => senha
end

Then('eu vejo a pagina inicial do barbeiro') do
  visit '/'
  expect(page).to have_current_path('/')
end

##Scenario 2
Then('eu vejo a mensagem de que o telefone do barbeiro e invalido') do
  expect(page).to have_content('Telefone is not a number')
end

##Scenario 3
Given('estou na pagina de login do barbeiro') do
  visit '/barbeiros/sign_in'
  expect(page).to have_current_path('/barbeiros/sign_in')
end

When('entao eu preencho os campos de login com o email {string} password {string}') do |email, senha|
  fill_in 'barbeiro[email]', :with => email
  fill_in 'barbeiro[password]', :with => senha
end

##Scenario 5
Then('eu vejo a mensagem que a data de nascimento esta invalida') do
  expect(page).to have_content("Data nascimento can't be blank")
end