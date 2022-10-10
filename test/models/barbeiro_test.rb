require "test_helper"

class BarbeiroTest < ActiveSupport::TestCase
  test 'Criando barbeiro com o campo nome invalido' do
    barbeiro = Barbeiro.new nome: 'Douglas Batista 00', data_nascimento: '1996-09-01',
                            telefone: "87996789102", email: 'douglas@teste.com', password: 'barbeiroteste'
    assert_not barbeiro.save
  end

  test 'Criando barbeiro com o campo data de nascimento invalido' do
    barbeiro = Barbeiro.new nome: 'Luiz Gustavo', data_nascimento: Time.zone.tomorrow,
                            telefone: "87977789102", email: 'luizs@teste.com', password: 'barbeiroteste'
    assert_not barbeiro.save
  end

  test 'Criando barbeiro com dados válidos' do
    barbeiro = Barbeiro.new nome: 'Eduarda Interaminense', data_nascimento: '2000-05-10',
                            telefone: "87996789999", email: 'eduardas@teste.com', password: 'barbeiroteste'
    assert barbeiro.save
  end
end
