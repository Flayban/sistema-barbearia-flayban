##Scenario 1
Given('estou na pagina do barbeiro') do
  visit '/barbeiros/'
  expect(page).to have_current_path('/barbeiros/')
end

Given('eu clico em criar novo barbeiro') do
  click_on 'New barbeiro'
end

When('eu preencho os dados nome {string}  cpf {string}  data_nascimento {string}  telefone {string}  email {string}') do |nome, cpf, data_nascimento, telefone, email|
  fill_in 'barbeiro[nome]', :with => nome
  fill_in 'barbeiro[cpf]', :with => cpf
  fill_in 'barbeiro[data_nascimento]', :with => data_nascimento
  fill_in 'barbeiro[telefone]', :with => telefone
  fill_in 'barbeiro[email]', :with => email
end

When('eu clico no botao de criar barbeiro') do
  click_button 'Create Barbeiro'
end

Then('eu vejo a mensagem de que o barbeiro foi criado com sucesso') do
  expect(page).to have_content('Barbeiro was successfully created')
end

##Scenario 2
Then('eu vejo a mensagem de que o cpf do barbeiro e invalido') do
  expect(page).to have_content('Cpf formato ou numero errado')
end

