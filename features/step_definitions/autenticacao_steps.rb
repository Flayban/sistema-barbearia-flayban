##Scenario 01
Given('estou na pagina para criar um administrador') do
  visit '/admins/sign_up'
  expect(page).to have_current_path('/admins/sign_up')
end

When('eu preencho os campos de nome {string} telefone {string} data_nascimento {string} email {string} password {string}') do |nome, telefone, email, data_nascimento, senha|
  fill_in 'admin[nome]', :with => nome
  fill_in 'admin[telefone]', :with => telefone
  fill_in 'admin[data_nascimento]', :with => data_nascimento
  fill_in 'admin[email]', :with => email
  fill_in 'admin[password]', :with => senha
  fill_in 'admin[password_confirmation]', :with => senha
end

When('eu clico no botão Sign up') do
  click_button 'Sign up'
end

Then('eu vejo a pagina inicial do administrador') do
  visit '/'
  expect(page).to have_current_path('/')
end

##Scenario 02
Then('eu vejo a mensagem que o nome nao pode ficar em branco') do
  expect(page).to have_content("Nome can't be blank")
end

##Scenario 03
Given('estou na pagina de login de administrador') do
  visit '/admins/sign_in'
  expect(page).to have_current_path('/admins/sign_in')
end

When('eu preencho os campos de email {string} password {string}') do |email, senha|
  fill_in 'admin[email]', :with => email
  fill_in 'admin[password]', :with => senha
end

When('eu clico no botao Log in') do
  click_button 'Log in'
end

##Scenario 04
Then('eu vejo a mensagem que a senha e muito curta') do
  expect(page).to have_content('Password is too short (minimum is 6 characters)')
end

##Scenario 05
When('eu preencho os campos de nome {string} telefone {string} data_nascimento {string} email {string} password {string} password_confirmation {string}') do |nome, telefone, email, data_nascimento, senha, confirmacao_senha|
  fill_in 'admin[nome]', :with => nome
  fill_in 'admin[telefone]', :with => telefone
  fill_in 'admin[data_nascimento]', :with => data_nascimento
  fill_in 'admin[email]', :with => email
  fill_in 'admin[password]', :with => senha
  fill_in 'admin[password_confirmation]', :with => confirmacao_senha
end

Then('eu vejo a mensagem que a confirmacao de senha nao corresponde') do
  expect(page).to have_content("Password confirmation doesn't match Password")
end



