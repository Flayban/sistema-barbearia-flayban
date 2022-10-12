Feature: service
  As a Admin
  I want to adicionar, remover, editar e visualizar um servico no sistema
  So that o cliente consiga escolher o servico que deseja da barbearia

  Scenario: adicionar um servico
    Given estou na pagina dos servicos
    And eu clico em criar novo servico
    When eu preencho os campos nome 'Corte' valor '15,00' tempo '30'
    And eu clico no botao de criar servico
    Then eu vejo a mensagem de que o servico foi criado com sucesso

  Scenario: editar informacoes do servico
    Given estou na pagina dos servicos
    And o servico com nome 'Limpeza' existe
    And eu clico em mostrar o servico com nome 'Limpeza'
    And eu clico em editar o servico
    When eu preencho os campos nome 'Degrade' valor '25,00' tempo '30'
    And eu clico no botao de atualizar servico
    Then eu vejo a mensagem de que o servico foi atualizado com sucesso

  Scenario: adicionar um servico com tempo invalido
    Given estou na pagina dos servicos
    And eu clico em criar novo servico
    When eu preencho os campos nome 'Esfoliacao' valor '20,00' tempo '3'
    And eu clico no botao de criar servico
    Then eu vejo a mensagem 'tempo invalido'

  Scenario: adicionar um servico sem nome
    Given estou na pagina dos servicos
    And eu clico em criar novo servico
    When eu preencho os campos nome '' valor '22,00' tempo '30'
    And eu clico no botao de criar servico
    Then eu vejo a mensagem 'necessario preencher o campo de nome'

  Scenario: adicionar um servico sem valor
    Given estou na pagina dos servicos
    And eu clico em criar novo servico
    When eu preencho os campos nome 'Sobrancelha' valor '' tempo '30'
    And eu clico no botao de criar servico
    Then eu vejo a mensagem 'necessario informar um valor'





