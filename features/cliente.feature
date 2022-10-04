Feature: Cliente
  As a cliente
  I want to adicionar, remover visualizar e editar meu cadastro
  So that eu nao tenho que fazer isso de forma manual ou presencial

  Scenario: cadastrar novo  cliente
    Given estou na pagina do cliente
    And eu clico em criar novo cliente
    When eu preencho os dados nome 'Luiz Gustavo'  telefone '11743717984'  email 'martins.567@hotmai.com' data_nascimento '19-04-1999'
    And eu clico no botao de criar cliente
    Then eu vejo a mensagem de que o cliente foi criado com sucesso

  Scenario: cadastrar novo cliente com email invalido
    Given estou na pagina do cliente
    And eu clico em criar novo cliente
    When eu preencho os dados nome 'Luiz Gustavo'  telefone '87981370311'  email 'martins.567@.com' data_nascimento '19-04-1999'
    And eu clico no botao de criar cliente
    Then eu vejo a mensagem de que o email do cliente e invalido

  Scenario: editar informacoes do cliente
    Given estou na pagina do cliente
    And o cliente com telefone '11743717984' existe
    And eu clico em mostrar o cliente com telefone '11743717984'
    And eu clico em editar o cadastro do cliente
    When eu preencho os dados nome 'Jose Antonio'  telefone '11139290656'  email 'joseantonio.567@hotmail.com' data_nascimento '21-02-1998'
    And eu clico no botao de atualizar cliente
    Then eu vejo a mensagem de que o cliente foi atualizado com sucesso

  Scenario: remover cliente
    Given estou na pagina do cliente
    And o cliente com telefone ‘87988570311’ existe
    And eu clico em mostrar o cliente com telefone '87988570311'
    When eu clico em remover o cliente
    Then eu vejo a mensagem de que o cliente foi apagado com sucesso

  Scenario: visualizar informacoes do cliente
    Given estou na pagina do cliente
    And o cliente com telefone '87991095553' existe
    And eu clico em mostrar o cliente com telefone '87991095553'
    Then eu vejo a todas informacoes do cliente com telefone '87991095553'