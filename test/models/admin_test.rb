require "test_helper"

class AdminTest < ActiveSupport::TestCase
  test 'Criando administrador com nascimento inválido' do
    admin = Admin.new nome: 'Eduarda Interaminense', telefone: '87999887766',
                      data_nascimento: Time.zone.tomorrow, email: 'eduarda@admin.teste',
                      password: 'adminteste'
    assert_not admin.save
  end

  test 'Criando administrador com telefone inválido' do
    admin = Admin.new nome: 'João Victor', telefone: 'telefoneteste',
                      data_nascimento: '01/01/1999', email: 'jv@admin.teste',
                      password: 'adminteste'
    assert_not admin.save
  end

  test 'Criando administrador com dados válidos' do
    admin = Admin.new nome: 'Luiz Gustavo', telefone: '87999887755',
                      data_nascimento: '22/09/2000', email: 'luiz@admin.teste',
                      password: 'adminteste'
    assert admin.save
  end
end
