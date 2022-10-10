Given('estou logado como administrador com o email {string} e senha {string}') do |email, senha|
  visit '/admins/sign_in'
  fill_in 'admin[email]', :with => email
  fill_in 'admin[password]', :with => senha
  click_button 'Log in'
end

Given('estou na tela de criar um servico') do
  visit '/services/new'
end

Then('eu preencho os campos de nome {string} valor {string} e tempo {string}') do |nome, valor ,tempo|
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