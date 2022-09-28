Feature: agendamento
  As a Cliente
  I want to geranciar um atendimento na barbearia
  So that eu seja atendido na hora marcada
  Scenario: cadastrar um Agendamento
    Given um cliente cadastrado com nome 'Luiz Gustavo'  telefone '87988570311'  email 'martins.567@hotmai.com' data_nascimento '19-04-1999' existe
    And existe um barbeiro com o nome 'Douglas Filipe'  cpf '10307715450'  data_nascimento '1996-09-01'  telefone '87996789102'  email 'douglas@test.com'
    When eu estou na pagina do cliente
    And eu seleciono o barbeiro 'Douglas Filipe' e o inicioAtendimento '15:00'
    And eu clico em Create Agendamento
    Then eu vejo uma mensagem de confirmacao do sistema

  Scenario: criar um agendamento sem definir um barbeiro
    Given um cliente cadastrado com nome 'Luiz Gustavo'  telefone '87988570311'  email 'martins.567@hotmai.com' data_nascimento '19-04-1999' existe
    And existe um barbeiro com o nome 'Douglas Filipe'  cpf '10307715450'  data_nascimento '1996-09-01'  telefone '87996789102'  email 'douglas@test.com'
    When eu estou na pagina do cliente
    And eu seleciono o inicioAtendimento '15:00'
    And eu clico em Create Agendamento
    Then eu vejo uma mensagem de erro

  Scenario: cadastrar um agendamento antes da abertura da barbearia
    Given um cliente cadastrado com nome 'Luiz Gustavo'  telefone '87988570311'  email 'martins.567@hotmai.com' data_nascimento '19-04-1999' existe
    And existe um barbeiro com o nome 'Douglas Filipe'  cpf '10307715450'  data_nascimento '1996-09-01'  telefone '87996789102'  email 'douglas@test.com'
    When eu estou na pagina do cliente
    And eu seleciono o barbeiro 'Douglas Filipe' e o inicioAtendimento '3:00'
    And eu clico em Create Agendamento
    Then eu vejo uma mensagem de erro

  Scenario: cadastrar um agendamento depois do fechamento da barbearia
    Given um cliente cadastrado com nome 'Luiz Gustavo'  telefone '87988570311'  email 'martins.567@hotmai.com' data_nascimento '19-04-1999' existe
    And existe um barbeiro com o nome 'Douglas Filipe'  cpf '10307715450'  data_nascimento '1996-09-01'  telefone '87996789102'  email 'douglas@test.com'
    When eu estou na pagina do cliente
    And eu seleciono o barbeiro 'Douglas Filipe' e o inicioAtendimento '23:00'
    And eu clico em Create Agendamento
    Then eu vejo uma mensagem de erro

  Scenario: cadastrar um agendamento durante o horario de almoco
    Given um cliente cadastrado com nome 'Luiz Gustavo'  telefone '87988570311'  email 'martins.567@hotmai.com' data_nascimento '19-04-1999' existe
    And existe um barbeiro com o nome 'Douglas Filipe'  cpf '10307715450'  data_nascimento '1996-09-01'  telefone '87996789102'  email 'douglas@test.com'
    When eu estou na pagina do cliente
    And eu seleciono o barbeiro 'Douglas Filipe' e o inicioAtendimento '12:00'
    And eu clico em Create Agendamento
    Then eu vejo uma mensagem de erro

