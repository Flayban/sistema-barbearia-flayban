Feature: Barbeiro
  As a barbeiro
  I want to adicionar, remover visualizar e editar meu cadastro
  So that eu nao tenho que fazer isso de forma manual ou presencial

  Scenario: cadastrar novo  barbeiro
    Given estou na pagina para criar um barbeiro
    When eu preencho os dados de nome 'Alane Jessany' telefone '87996780000' data_nascimento '1996-09-01' email 'alane@test.com' password 'barbeiroteste'
    And eu clico no botão Sign up
    Then eu vejo a pagina inicial do barbeiro

  Scenario: cadastrar novo barbeiro com telefone invalido
    Given estou na pagina para criar um barbeiro
    When eu preencho os dados de nome 'Alane Jessany' telefone 'teste' data_nascimento '1996-09-01' email 'alane@test.com' password 'barbeiroteste'
    And eu clico no botão Sign up
    Then eu vejo a mensagem de que o telefone do barbeiro e invalido

  Scenario: Realizar login no sistema como um barbeiro
    Given estou na pagina de login do barbeiro
    When entao eu preencho os campos de login com o email 'alane@test.com' password 'barbeiroteste'
    And  clico no botao Log in
    Then eu vejo a pagina inicial dos clientes

  Scenario: criar barbeiro com senha menor que o esperado
    Given estou na pagina para criar um barbeiro
    When eu preencho os dados de nome 'Alane Jessany' telefone '87996789144' data_nascimento '1996-09-01' email 'alane@test.com' password 'test'
    And eu clico no botão Sign up
    Then eu vejo a mensagem que a senha e muito pequena

  Scenario: criar barbeiro com data de nascimento em branco
    Given estou na pagina para criar um barbeiro
    When eu preencho os dados de nome 'Alane Jessany' telefone '87996789144' data_nascimento '' email 'alane@test.com' password 'barbeiroteste'
    And eu clico no botão Sign up
    Then eu vejo a mensagem que a data de nascimento esta invalida