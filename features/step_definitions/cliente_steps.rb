#primeiro cenário
Given('estou na pagina do cliente') do
  visit '/clientes/'
  expect(page).to have_current_path('/clientes/')
end

Given('eu clico em criar novo cliente') do
  click_on 'New cliente'
end

When('eu preencho os dados nome {string}  telefone {string}  email {string} data_nascimento {string}') do |nome, telefone, email, data_nascimento|
  fill_in 'cliente[nome]', :with => nome
  fill_in 'cliente[telefone]', :with => telefone
  fill_in 'cliente[email]', :with => email
  fill_in 'cliente[data_nascimento]', :with => data_nascimento
end

When('eu clico no botao de criar cliente') do
  click_button 'Create Cliente'
end

Then('eu vejo a mensagem de que o cliente foi criado com sucesso') do
  expect(page).to have_content('Cliente was successfully created')
end

#segundo cenário

Then('eu vejo a mensagem de que o email do cliente e invalido') do
  expect(page).to have_content('Email is invalid')
end

#terceiro cenário
Given('o cliente com telefone {string} existe') do |telefone|
  visit '/clientes/new'
  fill_in 'cliente[nome]', :with => 'Augusto Cesar'
  fill_in 'cliente[telefone]', :with => telefone
  fill_in 'cliente[email]', :with => 'cesar.567@hotmail.com'
  fill_in 'cliente[data_nascimento]', :with => '21/04/1981'
  click_on 'Create Cliente'
  expect(page).to have_content(telefone)
  visit '/clientes/'
  expect(page).to have_current_path(/clientes/)

end

Given('eu clico em mostrar o cliente com telefone {string}') do |telefone|
  click_on "#{telefone}"
end

Given('eu clico em editar o cadastro do cliente') do
  click_on 'Edit this cliente'
end

When('eu clico no botao de atualizar cliente') do
  click_on 'Update Cliente'
end

Then('eu vejo a mensagem de que o cliente foi atualizado com sucesso') do
  expect(page).to have_content('Cliente was successfully update')
end

#quarto cenário
Given('o cliente com telefone ‘{int}’ existe') do |telefone|
  visit '/clientes/new'
  fill_in 'cliente[nome]', :with => 'Augusto Cesar'
  fill_in 'cliente[telefone]', :with => telefone
  fill_in 'cliente[email]', :with => 'cesar.567@hotmail.com'
  fill_in 'cliente[data_nascimento]', :with => '21/04/1981'
  click_on 'Create Cliente'
  expect(page).to have_content(telefone)
  visit '/clientes/'
  expect(page).to have_current_path(/clientes/)

end

When('eu clico em remover o cliente') do
  click_button 'Destroy this cliente'
end


Then('eu vejo a mensagem de que o cliente foi apagado com sucesso') do
  expect(page).to have_content('Cliente was successfully destroyed')
end

#quinto cenário

Then('eu vejo a todas informacoes do cliente com telefone {string}') do |telefone|
  expect(page).to have_content(telefone)
end




