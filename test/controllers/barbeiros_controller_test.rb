require "test_helper"

class BarbeirosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barbeiro = barbeiros(:one)
  end

  test "should get index" do
    get barbeiros_url
    assert_response :success
  end

  test "should get new" do
    get new_barbeiro_url
    assert_response :success
  end

  test "should create barbeiro" do
    assert_difference("Barbeiro.count") do
      post barbeiros_url, params: { barbeiro: { cpf: @barbeiro.cpf, data_nascimento: @barbeiro.data_nascimento, email: @barbeiro.email, nome: @barbeiro.nome, telefone: @barbeiro.telefone } }
    end

    assert_redirected_to barbeiro_url(Barbeiro.last)
  end

  test "should show barbeiro" do
    get barbeiro_url(@barbeiro)
    assert_response :success
  end

  test "should get edit" do
    get edit_barbeiro_url(@barbeiro)
    assert_response :success
  end

  test "should update barbeiro" do
    patch barbeiro_url(@barbeiro), params: { barbeiro: { cpf: @barbeiro.cpf, data_nascimento: @barbeiro.data_nascimento, email: @barbeiro.email, nome: @barbeiro.nome, telefone: @barbeiro.telefone } }
    assert_redirected_to barbeiro_url(@barbeiro)
  end

  test "should destroy barbeiro" do
    assert_difference("Barbeiro.count", -1) do
      delete barbeiro_url(@barbeiro)
    end

    assert_redirected_to barbeiros_url
  end
end
