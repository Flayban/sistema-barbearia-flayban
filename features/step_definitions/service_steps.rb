##Scenario 1
Given('estou na pagina dos servicos') do
  visit '/services/'
  expect(page).to have_current_path('/services/')
end

Given('eu clico em criar novo servico') do
  click_on 'New service'
end

When('eu preencho os campos nome {string} valor {string} tempo {string}') do |nome, valor, tempo|
  fill_in 'service[nome]', :with => nome
  fill_in 'service[valor]', :with => valor
  fill_in 'service[tempo]', :with => tempo
end

When('eu clico no botao de criar servico') do
  click_button 'Create Service'
end

Then('eu vejo a mensagem de que o servico foi criado com sucesso') do
  expect(page).to have_content('Service was successfully created')
end

##Scenario 2
Given('o servico com nome {string} existe') do |nome|
  visit '/services/new'
  fill_in 'service[nome]', :with => nome
  fill_in 'service[valor]', :with => '20,00'
  fill_in 'service[tempo]', :with => '30'

  click_on 'Create Service'

  expect(page).to have_content(nome)
  visit '/services/'
  expect(page).to have_current_path(/services/)

end

Given('eu clico em mostrar o servico com nome {string}') do |nome|
  click_on "#{nome}"
end

Given('eu clico em editar o servico') do
  click_on 'Edit this service'
end

When('eu clico no botao de atualizar servico') do
  click_on 'Update Service'
end

Then('eu vejo a mensagem de que o servico foi atualizado com sucesso') do
  expect(page).to have_content('Service was successfully update')
end

##Scenario 3
Then('eu vejo a mensagem {string}') do |text|
  page.has_text?(text)
end