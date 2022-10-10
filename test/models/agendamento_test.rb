require "test_helper"

class AgendamentoTest < ActiveSupport::TestCase
  test "criar agendamento valido" do
    cliente = Cliente.new(nome:"Jucas", telefone:"08740028922", data_nascimento: "09/02/1997",
                          email: "email@email.com", password:"622612")
    assert cliente.save

    barbeiro = Barbeiro.new(nome: "Indigo", telefone: "08734568901", data_nascimento: "02/07/1990",
                            email: "barbeiro@email.com", password:"655622")
    assert barbeiro.save

    service = Service.new nome:"Corte de cabelo", valor:"10,00", tempo: "30"
    assert service.save

    agendamento = Agendamento.new(inicioAtendimento: "14:00", cliente_id: cliente.id, barbeiro_id: barbeiro.id, service_id: service.id)

    assert agendamento.save
  end

  test "criar agendamento no horario de almoco" do
    cliente = Cliente.new(nome:"Jucas", telefone:"08740028922", data_nascimento: "09/02/1997",
                          email: "email@email.com", password:"655611")
    assert cliente.save

    barbeiro = Barbeiro.new(nome: "Indigo", telefone: "08734568901", data_nascimento: "02/07/1990",
                            email: "barbeiro@email.com", password:"611612")
    assert barbeiro.save

    service = Service.new nome:"Corte de cabelo e barba", valor:"25,00", tempo: "30"
    assert service.save

    agendamento = Agendamento.new(inicioAtendimento: "12:00", cliente_id: cliente.id, barbeiro_id: barbeiro.id, service_id: service.id)

    assert_not agendamento.save
  end

  test "criar agendamento apos o fechamento" do
    cliente = Cliente.new(nome:"Jucas", telefone:"08740028922", data_nascimento: "09/02/1997",
                          email: "email@email.com", password:"655600")
    assert cliente.save

    barbeiro = Barbeiro.new(nome: "Indigo", telefone: "08734568901", data_nascimento: "02/07/1990",
                            email: "barbeiro@email.com", password:"600612")
    assert barbeiro.save

    service = Service.new nome:"Corte apenas de cabelo", valor:"10,00", tempo: "30"
    assert service.save

    agendamento = Agendamento.new(inicioAtendimento: "23:00", cliente_id: cliente.id, barbeiro_id: barbeiro.id, service_id: service.id)

    assert_not agendamento.save
  end
end
