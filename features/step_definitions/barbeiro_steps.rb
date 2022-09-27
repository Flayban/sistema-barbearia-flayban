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

##Scenario 3
Given('o barbeiro com cpf {string} existe') do |cpf|
  visit '/barbeiros/new'
  fill_in 'barbeiro[nome]', :with => 'Micael Miranda'
  fill_in 'barbeiro[cpf]', :with => cpf
  fill_in 'barbeiro[data_nascimento]', :with => '21/04/1981'
  fill_in 'barbeiro[telefone]', :with => '87996002233'
  fill_in 'barbeiro[email]', :with => 'micael@test.com'
  click_on 'Create Barbeiro'
  expect(page).to have_content(cpf)
  visit '/barbeiros/'
  expect(page).to have_current_path(/barbeiros/)
end

Given('eu clico em mostrar o barbeiro com cpf {string}') do |cpf|
  click_on "#{cpf}"
end

Given('eu clico em editar o cadastro do barbeiro') do
  click_on 'Edit this barbeiro'
end

When('eu clico no botao de atualizar barbeiro') do
  click_on 'Update Barbeiro'
end

Then('eu vejo a mensagem de que o barbeiro foi atualizado com sucesso') do
  expect(page).to have_content('Barbeiro was successfully update')
end

##Scenario 4
Given('o barbeiro com cpf ‘{int}’ existe') do |cpf|
  visit '/barbeiros/new'
  fill_in 'barbeiro[nome]', :with => 'Micael Miranda'
  fill_in 'barbeiro[cpf]', :with => cpf
  fill_in 'barbeiro[data_nascimento]', :with => '21/04/1981'
  fill_in 'barbeiro[telefone]', :with => '87996002233'
  fill_in 'barbeiro[email]', :with => 'micael@test.com'
  click_on 'Create Barbeiro'
  expect(page).to have_content(cpf)
  visit '/barbeiros/'
  expect(page).to have_current_path(/barbeiros/)
end

When('eu clico em remover o barbeiro') do
  click_button 'Destroy this barbeiro'
end

Then('eu vejo a mensagem de que o barbeiro foi apagado com sucesso') do
  expect(page).to have_content('Barbeiro was successfully destroyed')
end


##Scenario 5
Then('eu vejo a todas informacoes do barbeiro com cpf {string}') do |cpf|
  expect(page).to have_content(cpf)
end