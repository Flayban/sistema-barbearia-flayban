require "test_helper"

class ClienteTest < ActiveSupport::TestCase
  test 'Criando cliente com nascimento inválido' do
    cliente = Cliente.new nome: 'João Cordeiro', telefone: '87988625344',
                          email: 'teste@test.com', data_nascimento: Time.zone.tomorrow
    assert_not cliente.save
  end
  test 'Criando cliente com telefone invalido' do
    cliente = Cliente.new nome: 'João Victor', telefone: '40028922',
                          email: 'teste@teste.com', data_nascimento: '29/05/2001'
    assert_not cliente.save
  end
  test 'Criando cliente com dados válidos' do
    cliente = Cliente.new nome: 'João Victor', telefone: '87988625344',
                          email: 'teste@teste.com', data_nascimento: '29/06/2000'
    assert cliente.save
  end
end
