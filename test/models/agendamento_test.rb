require "test_helper"

class AgendamentoTest < ActiveSupport::TestCase
  test "criar agendamento valido" do
    cliente = Cliente.new(nome:"Jucas", telefone:"08740028922", email: "email@email.com", data_nascimento: "09/02/1997")
    assert cliente.save

    barbeiro = Barbeiro.new(nome: "Indigo", cpf: "27071571040", data_nascimento: "02/07/1990", telefone: "08734568901",
                            email: "barbeiro@email.com")
    assert barbeiro.save

    agendamento = Agendamento.new(inicioAtendimento: "14:00", cliente_id: cliente.id, barbeiro_id: barbeiro.id)

    assert agendamento.save
  end

  test "criar agendamento no horario de almoco" do
    cliente = Cliente.new(nome:"Jucas", telefone:"08740028922", email: "email@email.com", data_nascimento: "09/02/1997")
    assert cliente.save

    barbeiro = Barbeiro.new(nome: "Indigo", cpf: "27071571040", data_nascimento: "02/07/1990", telefone: "08734568901",
                            email: "barbeiro@email.com")
    assert barbeiro.save

    agendamento = Agendamento.new(inicioAtendimento: "12:00", cliente_id: cliente.id, barbeiro_id: barbeiro.id)

    assert_not agendamento.save
  end

  test "criar agendamento apos o fechamento" do
    cliente = Cliente.new(nome:"Jucas", telefone:"08740028922", email: "email@email.com", data_nascimento: "09/02/1997")
    assert cliente.save

    barbeiro = Barbeiro.new(nome: "Indigo", cpf: "27071571040", data_nascimento: "02/07/1990", telefone: "08734568901",
                            email: "barbeiro@email.com")
    assert barbeiro.save

    agendamento = Agendamento.new(inicioAtendimento: "23:00", cliente_id: cliente.id, barbeiro_id: barbeiro.id)

    assert_not agendamento.save
  end
end
