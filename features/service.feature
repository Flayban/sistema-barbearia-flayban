Feature: service
  As a Admin
  I want to adicionar, remover, editar e visualizar um servico no sistema
  So that o cliente consiga escolher o servico que deseja da barbearia

  Scenario: adicionar um servico
    Given estou na pagina de login do administrador
    And insiro as informacoes de login do administrador
    And eu clico no botão Sign up
    And estou na tela de criar um servico
    When eu preencho os campos de nome 'Corte e barba' valor '25,00' e tempo '30'
    And clico em criar servico
    Then eu vejo a mensagem 'cadastro bem sucedido'

  Scenario: editar informacoes do servico
    Given estou na pagina de login do administrador
    And insiro as informacoes de login do administrador
    And eu clico no botão Sign up
    And existe um servico com nome de 'Corte'
    And eu clico em editar as informacoes do servico
    When eu preencho os campos de nome 'Corte e barba' valor '25,00' e tempo '30'
    And clico em editar servico
    Then eu vejo a mensagem 'Servico atualizado com sucesso'

  Scenario: adicionar um servico com tempo invalido
    Given estou na pagina de login do administrador
    And insiro as informacoes de login do administrador
    And eu clico no botão Sign up
    And estou na tela de criar um servico
    When eu preencho os campos de nome 'Corte e barba' valor '25,00' e tempo '3'
    And clico em criar servico
    Then eu vejo a mensagem 'tempo invalido'

  Scenario: adicionar um servico sem nome
    Given estou na pagina de login do administrador
    And insiro as informacoes de login do administrador
    And eu clico no botão Sign up
    And estou na tela de criar um servico
    When eu preencho os campos de valor '25,00' e tempo '3'
    And clico no botao criar servico
    Then eu vejo a mensagem 'necessario preencher o campo de nome'

  Scenario: adicionar um servico sem valor
    Given estou na pagina de login do administrador
    And insiro as informacoes de login do administrador
    And eu clico no botão Sign up
    And estou na tela de criar um servico
    When eu preencho os campos de nome 'Corte e barba' e tempo '3'
    And clico no criar servico
    Then eu vejo a mensagem 'necessario informar um valor'


