Feature: agendamento
  As a Cliente
  I want to realizar um agendamento
  So that eu seja atendido na hora marcada
  Scenario: cadastrar uma consulta
    Given eu estou cadastrado no sistema com o nome 'Jucas' e a data de nascimento '09/02/1997' e o telefone '08740028922' e o email 'email@email.com'
    When eu crio um agendamento com o barbeiro com nome 'Indigo' e cpf '27071571040 e a data de nascimento '02/07/1990' e o telefone '08734568901' e o email 'barbeiro@email.com' e o inicio do atendimento '15:00'
    And eu clico em criar um agendamento
    Then eu vejo uma mensagem de confirmacao do sistema

  Scenario: editar um agendamento
    Given eu estou cadastrado no sistema com o nome 'Jucas' e a data de nascimento '09/02/1997' e o telefone '08740028922' e o email 'email@email.com'
    And estou na pagina de cadastro de agendamentos
    When eu crio um agendamento com o barbeiro com nome 'Indigo' e cpf '27071571040 e a data de nascimento '02/07/1990' e o telefone '08734568901' e o email 'barbeiro@email.com' e o inicio do atendimento '15:00'
    And eu clico em criar um agendamento
    And eu estou na pagina de edicao de agendamento
    And eu edito um agendamento com o barbeiro com nome 'Indigo' e cpf '27071571040 e a data de nascimento '02/07/1990' e o telefone '08734568901' e o email 'barbeiro@email.com' e o inicio do atendimento '15:00'
    And eu clico em editar um agendamento
    Then eu vejo uma mensagem de confirmacao de edicao

  Scenario: cadastrar um agendamento antes da abertura da barbearia
    Given eu estou cadastrado no sistema com o nome 'Jucas' e a data de nascimento '09/02/1997' e o telefone '08740028922' e o email 'email@email.com'
    When eu crio um agendamento com o barbeiro com nome 'Indigo' e cpf '27071571040 e a data de nascimento '02/07/1990' e o telefone '08734568901' e o email 'barbeiro@email.com' e o inicio do atendimento '03:00'
    And eu clico em criar um agendamento
    Then eu vejo uma mensagem de erro

  Scenario: cadastrar um agendamento depois do fechamento da barbearia
    Given eu estou cadastrado no sistema com o nome 'Jucas' e a data de nascimento '09/02/1997' e o telefone '08740028922' e o email 'email@email.com'
    When eu crio um agendamento com o barbeiro com nome 'Indigo' e cpf '27071571040 e a data de nascimento '02/07/1990' e o telefone '08734568901' e o email 'barbeiro@email.com' e o inicio do atendimento '23:00'
    And eu clico em criar um agendamento
    Then eu vejo uma mensagem de erro

  Scenario: cadastrar um agendamento durante o horario de almoco
    Given eu estou cadastrado no sistema com o nome 'Jucas' e a data de nascimento '09/02/1997' e o telefone '08740028922' e o email 'email@email.com'
    When eu crio um agendamento com o barbeiro com nome 'Indigo' e cpf '27071571040 e a data de nascimento '02/07/1990' e o telefone '08734568901' e o email 'barbeiro@email.com' e o inicio do atendimento '12:00'
    And eu clico em criar um agendamento
    Then eu vejo uma mensagem de erro

