require "application_system_test_case"

class BarbeirosTest < ApplicationSystemTestCase
  setup do
    @barbeiro = barbeiros(:one)
  end

  test "visiting the index" do
    visit barbeiros_url
    assert_selector "h1", text: "Barbeiros"
  end

  test "should create barbeiro" do
    visit barbeiros_url
    click_on "New barbeiro"

    fill_in "Cpf", with: @barbeiro.cpf
    fill_in "Data nascimento", with: @barbeiro.data_nascimento
    fill_in "Email", with: @barbeiro.email
    fill_in "Nome", with: @barbeiro.nome
    fill_in "Telefone", with: @barbeiro.telefone
    click_on "Create Barbeiro"

    assert_text "Barbeiro was successfully created"
    click_on "Back"
  end

  test "should update Barbeiro" do
    visit barbeiro_url(@barbeiro)
    click_on "Edit this barbeiro", match: :first

    fill_in "Cpf", with: @barbeiro.cpf
    fill_in "Data nascimento", with: @barbeiro.data_nascimento
    fill_in "Email", with: @barbeiro.email
    fill_in "Nome", with: @barbeiro.nome
    fill_in "Telefone", with: @barbeiro.telefone
    click_on "Update Barbeiro"

    assert_text "Barbeiro was successfully updated"
    click_on "Back"
  end

  test "should destroy Barbeiro" do
    visit barbeiro_url(@barbeiro)
    click_on "Destroy this barbeiro", match: :first

    assert_text "Barbeiro was successfully destroyed"
  end
end
