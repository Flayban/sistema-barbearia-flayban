Feature: Cliente
  As a cliente
  I want to adicionar, remover visualizar e editar meu cadastro
  So that eu nao tenho que fazer isso de forma manual ou presencial

  Scenario: cadastrar novo cliente
    Given estou na pagina para criar um cliente
    When eu preencho os dados nome 'Luiz Gustavo'  telefone '11743717984' data_nascimento '19-04-1999' email 'josias.567@hotmai.com'  password '13131313'
    And entao eu clico no botão Sign up
    Then eu vejo a pagina inicial dos clientes

  Scenario: cadastrar novo cliente com email invalido
    Given estou na pagina para criar um cliente
    When eu preencho os dados nome 'Luiz Gustavo'  telefone '11743717984' data_nascimento '19-04-1999' email 'josias.567'  password '13131313'
    And entao eu clico no botão Sign up
    Then eu vejo a mensagem que deve existir um @ no endereco de email

  Scenario: Realizar login no sistema como um cliente
    Given estou na pagina de login do cliente
    When entao eu preencho os campos de email 'luiz@cliente.com' password '13131313'
    And  clico no botao Log in
    Then eu vejo a pagina inicial dos clientes

  Scenario: criar cliente com senha menor que o esperado
    Given estou na pagina para criar um cliente
    When eu preencho os dados nome 'Luis Gustavo'  telefone '11743757984' data_nascimento '19-04-1999' email 'luiz.@cliente.com'  password '1313'
    And entao eu clico no botão Sign up
    Then eu vejo a mensagem que a senha e muito pequena

  Scenario: criar cliente com data de nascimento no futuro
    Given estou na pagina para criar um cliente
    When eu preencho os dados nome 'Kleber'  telefone '87991534509' data_nascimento '19-04-2032' email 'luiz13@cliente.com'  password '131313'
    And entao eu clico no botão Sign up
    Then eu vejo a mensagem que a data de nascimento e invalida