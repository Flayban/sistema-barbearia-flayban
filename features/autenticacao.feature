Feature: Autenticacao
  As a admin
  I want to adicionar, remover visualizar e editar meu cadastro
  So that os admins possam criar contas e logar no sistema

  Scenario: cadastrar novo admin
    Given estou na pagina para criar um administrador
    When eu preencho os campos de nome 'Douglas Batista' telefone '87996789102' data_nascimento '1996-09-01' email 'douglas@admin.com' password 'adminteste'
    And eu clico no botão Sign up
    Then eu vejo a pagina inicial do administrador

  Scenario: criar admin com nome em branco
    Given estou na pagina para criar um administrador
    When eu preencho os campos de nome '' telefone '87996789102' data_nascimento '1996-09-01' email 'douglas@admin.com' password 'adminteste'
    And eu clico no botão Sign up
    Then eu vejo a mensagem que o nome nao pode ficar em branco

  Scenario: Logar com admin corretamente
    Given estou na pagina de login de administrador
    When eu preencho os campos de email 'douglas@admin.com' password 'adminteste'
    And eu clico no botao Log in
    Then eu vejo a pagina inicial do administrador

  Scenario: criar admin com senha muito curta
    Given estou na pagina para criar um administrador
    When eu preencho os campos de nome 'Douglas Batista' telefone '87996789102' data_nascimento '1996-09-01' email 'douglas@admin.com' password 'adm'
    And eu clico no botão Sign up
    Then eu vejo a mensagem que a senha e muito curta

  Scenario: criar admin com Password confirmation diferente do Password
    Given estou na pagina para criar um administrador
    When eu preencho os campos de nome 'Douglas Batista' telefone '87996789102' data_nascimento '1996-09-01' email 'douglas@admin.com' password 'adminteste' password_confirmation 'testeteste'
    And eu clico no botão Sign up
    Then eu vejo a mensagem que a confirmacao de senha nao corresponde