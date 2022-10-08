require "test_helper"

class ServiceTest < ActiveSupport::TestCase

  # test "the truth" do
  #   assert true
  # end
  test "Criando serviço com valor invalidos" do
    service = Service.new nome:"Corte de cabelo e barba", valor:"25", tempo: "30"
    assert_not service.save
  end
  test "Criando serviço com nome invalidos" do
    service = Service.new nome:"Corte de cabelo com corte de barba e massagem facial", valor:"100,00", tempo: "30"
    assert_not service.save
  end
  test "Criando serviço com dados validos" do
    service = Service.new nome:"Corte apenas de cabelo", valor:"10,00", tempo: "30"
    assert service.save
  end
end
