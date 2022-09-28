#Scenario 1
Given('eu estou na pagina dos clientes') do
  visit "/clientes"
  expect(page).to have_current_path("/clientes")
  click_on 'Show this cliente'
end


When('eu crio um agendamento com o barbeiro com nome {string} e o inicioAtendimento {string}') do |barbeiro, inicioAtendimento|
  fill_in 'consultum[barbeiro]', with => barbeiro
  fill_in 'consultum[horario]', :with => inicioAtendimento

end

When('eu clico em create Agendamento') do
  click_button 'create Agendamento'
end

Then('eu vejo uma mensagem de confirmacao do sistema') do
  expect(page).to have_content('Agendamento was successfully created')
end
#Scenario 2
Given('eu estou na pagina do cliente com o id {string}') do |id|
  visit "/clientes/#{id}"
  expect(page).to have_current_path("/clientes/#{id}")
end

When('eu crio um agendamento com o inicioAtendimento {string}') do |inicioAtendimento|
  fill_in 'consultum[horario]', :with => inicioAtendimento

end

When('eu clico em create Agendamento') do
  click_button 'create Agendamento'
end

Then('eu vejo uma mensagem de erro') do
  expect(page).to have_content('Expected barbeiro field')
end
#Scenario 3
Given('eu estou na pagina do cliente com o id {string}') do |id|
  visit "/clientes/#{id}"
  expect(page).to have_current_path("/clientes/#{id}")
end

When('eu crio um agendamento com o barbeiro com nome {string} e o inicioAtendimento {string}') do |barbeiro, inicioAtendimento|
  fill_in 'consultum[barbeiro]', with => barbeiro
  fill_in 'consultum[horario]', :with => inicioAtendimento

end

When('eu clico em create Agendamento') do
  click_button 'create Agendamento'
end

Then('eu vejo uma mensagem de erro') do
  expect(page).to have_content('A barbearia ainda nao abriu!')
end
#Scenario 4
Given('eu estou na pagina do cliente com o id {string}') do |id|
  visit "/clientes/#{id}"
  expect(page).to have_current_path("/clientes/#{id}")
end

When('eu crio um agendamento com o barbeiro com nome {string} e o inicioAtendimento {string}') do |barbeiro, inicioAtendimento|
  fill_in 'consultum[barbeiro]', with => barbeiro
  fill_in 'consultum[horario]', :with => inicioAtendimento

end

When('eu clico em create Agendamento') do
  click_button 'create Agendamento'
end

Then('eu vejo uma mensagem de erro') do
  expect(page).to have_content('A barbearia esta fechada para o almoco!')
end
#Scenario 5
Given('eu estou na pagina do cliente com o id {string}') do |id|
  visit "/clientes/#{id}"
  expect(page).to have_current_path("/clientes/#{id}")
end

When('eu crio um agendamento com o barbeiro com nome {string} e o inicioAtendimento {string}') do |barbeiro, inicioAtendimento|
  fill_in 'consultum[barbeiro]', with => barbeiro
  fill_in 'consultum[horario]', :with => inicioAtendimento

end

When('eu clico em create Agendamento') do
  click_button 'create Agendamento'
end

Then('eu vejo uma mensagem de confirmacao do sistema') do
  expect(page).to have_content('A barbearia ja esta fechada!')
end