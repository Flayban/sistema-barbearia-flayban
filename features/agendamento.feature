Feature: agendamento
  As a Cliente
  I want to geranciar um atendimento na barbearia
  So that eu seja atendido na hora marcada


  Scenario: cadastrar um Agendamento
    Given existe um cliente com os dados nome 'Luiz Gustavo' telefone '87988570311' data_nascimento '19-04-1999' email 'martins.567@hotmai.com' password 'password'
    And existe um barbeiro com os dados nome 'Douglas Filipe' telefone '87996780000' data_nascimento '1996-09-01' email 'douglas@barber.com' password 'password'
    And existe um servico com os dados nome 'Corte' valor '25,00' e tempo '30'
    When eu estou na pagina de clientes e clico no cliente
    And eu seleciono o barbeiro 'Douglas Filipe' o servico 'Corte' e o inicioAtendimento '15:00'
    And eu clico em Create Agendamento
    Then eu vejo uma mensagem de confirmacao do sistema 'Agendamento concluido'

  Scenario: cadastrar um agendamento sem definir um servico
    Given existe um cliente com os dados nome 'Joao Victor' telefone '87988571111' data_nascimento '19-04-1999' email 'joao@hotmai.com' password 'password'
    And existe um barbeiro com os dados nome 'Alan Ferreira' telefone '87996782222' data_nascimento '1996-09-01' email 'alan@barber.com' password 'password'
    And existe um servico com os dados nome 'Barba' valor '25,00' e tempo '30'
    When eu estou na pagina de clientes e clico no cliente
    And eu seleciono o barbeiro 'Alan Ferreira' e o inicioAtendimento '15:00'
    And eu clico em Create Agendamento
    Then eu vejo uma mensagem de erro 'campo de servico precisa ser preenchido'

  Scenario: cadastrar um aqendamento antes da abertura da barbearia
    Given existe um cliente com os dados nome 'Lucas Flayban' telefone '87988573333' data_nascimento '19-04-1999' email 'lucas@hotmai.com' password 'password'
    And existe um barbeiro com os dados nome 'Caio Vinicius' telefone '87996784444' data_nascimento '1996-09-01' email 'caio@barber.com' password 'password'
    And existe um servico com os dados nome 'Sobrancelha' valor '25,00' e tempo '30'
    When eu estou na pagina de clientes e clico no cliente
    And eu seleciono o barbeiro 'Caio Vinicius' o servico 'Sobrancelha' e o inicioAtendimento '3:00'
    And eu clico em Create Agendamento
    Then eu vejo uma mensagem de erro 'A barbearia ainda nao abriu'

  Scenario: cadastrar um aqendamento depois do fechamento da barbearia
    Given existe um cliente com os dados nome 'Neto Batista' telefone '87988575555' data_nascimento '19-04-1999' email 'neto.567@hotmai.com' password 'password'
    And existe um barbeiro com os dados nome 'Eduarda Interaminense' telefone '87996786666' data_nascimento '1996-09-01' email 'eduarda@barber.com' password 'password'
    And existe um servico com os dados nome 'Pezinho' valor '25,00' e tempo '30'
    When eu estou na pagina de clientes e clico no cliente
    And eu seleciono o barbeiro 'Eduarda Interaminense' o servico 'Pezinho' e o inicioAtendimento '23:00'
    And eu clico em Create Agendamento
    Then eu vejo uma mensagem de erro 'A barbearia ainda esta fechada'

  Scenario: cadastrar um aqendamento durante o horario de almoco
    Given existe um cliente com os dados nome 'Luciano Fifto' telefone '87988577777' data_nascimento '19-04-1999' email 'fifto@hotmai.com' password 'password'
    And existe um barbeiro com os dados nome 'Vinicius Fifte' telefone '87996788888' data_nascimento '1996-09-01' email 'fifte@barber.com' password 'password'
    And existe um servico com os dados nome 'Barboterapia' valor '25,00' e tempo '30'
    When eu estou na pagina de clientes e clico no cliente
    And eu seleciono o barbeiro 'Vinicius Fifte' o servico 'Barboterapia' e o inicioAtendimento '12:00'
    And eu clico em Create Agendamento
    Then eu vejo uma mensagem de erro 'A barbearia ainda esta fechada'