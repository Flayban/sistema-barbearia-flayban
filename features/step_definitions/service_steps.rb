Given('estou na pagina de login do administrador') do
  visit '/admins/sign_up'
  expect(page).to have_current_path('/admins/sign_up')
end

When('insiro as informacoes de login do administrador') do
  fill_in 'admin[nome]', :with => 'Admin Silva'
  fill_in 'admin[telefone]', :with => '87996780000'
  fill_in 'admin[data_nascimento]', :with => '1996-09-01'
  fill_in 'admin[email]', :with => 'admin@admin.teste'
  fill_in 'admin[password]', :with => 'password'
  fill_in 'admin[password_confirmation]', :with => 'password'
end

Given('estou na tela de criar um servico') do
  visit '/services/new'
end

When('eu preencho os campos de nome {string} valor {string} e tempo {string}') do |nome, valor ,tempo|
  fill_in 'service[nome]', :with => nome
  fill_in 'service[valor]', :with => valor
  fill_in 'service[tempo]', :with => tempo
end

Then('clico em criar servico') do
  click_button 'Create Service'
end

Then('eu vejo a mensagem {string}') do |text|
  page.has_text?(text)
end

When('existe um servico com nome de {string}') do |nome|
  visit '/services/new'
  fill_in 'service[nome]', :with => nome
  fill_in 'service[valor]', :with => '12,00'
  fill_in 'service[tempo]', :with => '30'

  click_button 'Create Service'

  expect(page).to have_content(nome)
  visit '/services/'
  expect(page).to have_current_path(/services/)
end

When('eu clico em editar as informacoes do servico') do
  visit '/services/1/edit'
end

When('clico em editar servico') do
  click_on 'Update Service'
end

Then('eu preencho os campos de valor {string} e tempo {string}') do |valor ,tempo|
  fill_in 'service[valor]', :with => valor
  fill_in 'service[tempo]', :with => tempo

end

Then('clico no botao criar servico') do
  page.should_not have_content('service_nome')
end

Then('eu preencho os campos de nome {string} e tempo {string}') do |nome ,tempo|
  fill_in 'service[nome]', :with => nome
  fill_in 'service[tempo]', :with => tempo
end

Then('clico no criar servico') do
  page.should_not have_content('service_valor')
end

Then('eu vejo a todas informacoes do servico com nome {string}') do |nome|
  expect(page).to have_content(nome)
end