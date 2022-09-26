require "test_helper"

class BarbeiroTest < ActiveSupport::TestCase
  test 'Criando barbeiro com o campo nome invalido' do
    barbeiro = Barbeiro.new nome: 'Douglas Batista 00', cpf: '10307715450',
                            data_nascimento: '1996-09-01', telefone: "87996789102",
                            email: 'douglas@teste.com'
    assert_not barbeiro.save
  end

  test 'Criando barbeiro com o campo cpf invalido' do
    barbeiro = Barbeiro.new nome: 'Luiz Gustavo', cpf: '103077jjj15450',
                            data_nascimento: '1999-11-23', telefone: "87977789102",
                            email: 'luizs@teste.com'
    assert_not barbeiro.save
  end

  test 'Criando barbeiro com dados válidos' do
    barbeiro = Barbeiro.new nome: 'Eduarda Interaminense', cpf: '39948779037',
                            data_nascimento: '2000-05-10', telefone: "87996789999",
                            email: 'eduardas@teste.com'
    assert barbeiro.save
  end
end
