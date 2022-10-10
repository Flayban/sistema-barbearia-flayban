Feature: agendamento
  As a Cliente
  I want to geranciar um atendimento na barbearia
  So that eu seja atendido na hora marcada
  Scenario: cadastrar um Agendamento
    Given um cliente cadastrado com nome 'Luiz Gustavo'  telefone '87988570311'  email 'martins.567@hotmai.com' data_nascimento '19-04-1999' existe
    And existe um barbeiro com o nome 'Douglas Filipe'  cpf '10307715450'  data_nascimento '1996-09-01'  telefone '87996789102'  email 'douglas@test.com'
    And existe um servico com o nome 'Corte e barba' valor '25,00' e tempo '30'
    When eu estou na pagina de clientes e aperto no cliente com nome 'Luiz Gustavo'
    And eu seleciono o barbeiro 'Douglas Filipe' o servico 'Corte e barba' e o inicioAtendimento '15:00'
    And eu clico em Create Agendamento
    Then eu vejo uma mensagem de confirmacao do sistema 'Agendamento concluido'

  Scenario: criar um agendamento sem definir um barbeiro
    Given um cliente cadastrado com nome 'Luiz Gustavo'  telefone '87988570311'  email 'martins.567@hotmai.com' data_nascimento '19-04-1999' existe
    And existe um barbeiro com o nome 'Josias Almeida'  cpf '10307715450'  data_nascimento '1996-09-01'  telefone '87996789102'  email 'douglas@test.com'
    And existe um servico com o nome 'Corte' valor '15,00' e tempo '30'
    When eu estou na pagina de clientes e aperto no cliente com nome 'Luiz Gustavo'
    And eu seleciono o servico 'Corte' o inicioAtendimento '15:00'
    And eu clico no Create Agendamento
    Then eu vejo uma mensagem de erro 'campo de barbeiro precisa ser preenchido'

  Scenario: criar um agendamento sem definir um servico
    Given um cliente cadastrado com nome 'Luiz Gustavo'  telefone '87988570311'  email 'martins.567@hotmai.com' data_nascimento '19-04-1999' existe
    And existe um barbeiro com o nome 'Josias Almeida'  cpf '10307715450'  data_nascimento '1996-09-01'  telefone '87996789102'  email 'douglas@test.com'
    And existe um servico com o nome 'Barba' valor '12,00' e tempo '30'
    When eu estou na pagina de clientes e aperto no cliente com nome 'Luiz Gustavo'
    And eu seleciono o barbeiro 'Josias Almeida' e o inicioAtendimento '15:00'
    And eu clico no Create Agendamento
    Then eu vejo uma mensagem de erro 'campo de servico precisa ser preenchido'

  Scenario: cadastrar um agendamento antes da abertura da barbearia
    Given um cliente cadastrado com nome 'Luiz Gustavo'  telefone '87988570311'  email 'martins.567@hotmai.com' data_nascimento '19-04-1999' existe
    And existe um barbeiro com o nome 'Carlos Gustavo'  cpf '10307715450'  data_nascimento '1996-09-01'  telefone '87996789102'  email 'douglas@test.com'
    And existe um servico com o nome 'Corte e barba' valor '25,00' e tempo '30'
    When eu estou na pagina de clientes e aperto no cliente com nome 'Luiz Gustavo'
    And eu seleciono o barbeiro 'Carlos Gustavo' e o inicioAtendimento '3:00'
    And eu clico em Create Agendamento
    Then eu vejo uma mensagem de erro 'A barbearia ainda nao abriu'

  Scenario: cadastrar um agendamento depois do fechamento da barbearia
    Given um cliente cadastrado com nome 'Luiz Gustavo'  telefone '87988570311'  email 'martins.567@hotmai.com' data_nascimento '19-04-1999' existe
    And existe um barbeiro com o nome 'Charles Leclerc'  cpf '10307715450'  data_nascimento '1996-09-01'  telefone '87996789102'  email 'douglas@test.com'
    And existe um servico com o nome 'Sombrancelha' valor '10,00' e tempo '30'
    When eu estou na pagina de clientes e aperto no cliente com nome 'Luiz Gustavo'
    And eu seleciono o barbeiro 'Charles Leclerc' e o inicioAtendimento '23:00'
    And eu clico em Create Agendamento
    Then eu vejo uma mensagem de erro 'A barbearia ainda esta fechada'

  Scenario: cadastrar um agendamento durante o horario de almoco
    Given um cliente cadastrado com nome 'Luiz Gustavo'  telefone '87988570311'  email 'martins.567@hotmai.com' data_nascimento '19-04-1999' existe
    And existe um barbeiro com o nome 'George Russel'  cpf '10307715450'  data_nascimento '1996-09-01'  telefone '87996789102'  email 'douglas@test.com'
    And existe um servico com o nome 'Corte' valor '15,00' e tempo '30'
    When eu estou na pagina de clientes e aperto no cliente com nome 'Luiz Gustavo'
    And eu seleciono o barbeiro 'George Russel' e o inicioAtendimento '12:00'
    And eu clico em Create Agendamento
    Then eu vejo uma mensagem de erro 'A barbearia esta fechada para almoco'

