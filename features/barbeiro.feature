Feature: Barbeiro
  As a barbeiro
  I want to adicionar, remover visualizar e editar meu cadastro
  So that eu nao tenho que fazer isso de forma manual ou presencial

  Scenario: cadastrar novo  barbeiro
    Given estou na pagina do barbeiro
    And eu clico em criar novo barbeiro
    When eu preencho os dados nome 'Douglas Filipe'  cpf '10307715450'  data_nascimento '1996-09-01'  telefone '87996789102'  email 'douglas@test.com'
    And eu clico no botao de criar barbeiro
    Then eu vejo a mensagem de que o barbeiro foi criado com sucesso

  Scenario: cadastrar novo barbeiro com cpf invalido
    Given estou na pagina do barbeiro
    And eu clico em criar novo barbeiro
    When eu preencho os dados nome 'Douglas Filipe'  cpf '10307715455'  data_nascimento '1996-09-01'  telefone '87996789102'  email 'douglas@test.com'
    And eu clico no botao de criar barbeiro
    Then eu vejo a mensagem de que o cpf do barbeiro e invalido

  Scenario: editar informacoes do barbeiro
    Given estou na pagina do barbeiro
    And o barbeiro com cpf '10307715450' existe
    And eu clico em mostrar o barbeiro com cpf '10307715450'
    And eu clico em editar o cadastro do barbeiro
    When eu preencho os dados nome 'Eduarda Interaminense'  cpf '98422419041'  data_nascimento '2000-03-22'  telefone '87991187654'  email 'eduarda@test.com'
    And eu clico no botao de atualizar barbeiro
    Then eu vejo a mensagem de que o barbeiro foi atualizado com sucesso

  Scenario: remover barbeiro
    Given estou na pagina do barbeiro
    And o barbeiro com cpf ‘98422419041’ existe
    And eu clico em mostrar o barbeiro com cpf '98422419041'
    When eu clico em remover o barbeiro
    Then eu vejo a mensagem de que o barbeiro foi apagado com sucesso

  Scenario: visualizar informacoes do barbeiro
    Given estou na pagina do barbeiro
    And o barbeiro com cpf '98422419041' existe
    And eu clico em mostrar o barbeiro com cpf '98422419041'
    Then eu vejo a todas informacoes do barbeiro com cpf '98422419041'