class Barbeiro < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :agendamentos, :dependent => :destroy
  has_many :clientes, :through => :agendamentos

  validates :nome, presence: true, numericality: false, length: {in: 5..40},
            format: { with: /\A[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+\z/}
  # validate :cpf_valido
  validate :data_nascimento_valida
  validates :data_nascimento, presence: true
  validates :telefone, presence: true, numericality: true, length: { is: 11 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def data_nascimento_valida
    if data_nascimento.present? && data_nascimento > Time.zone.today
      errors.add(:data, "não pode ser no futuro")
    end
  end

  ##def cpf_valido
  ##if cpf.present? && !CPF.valid?(cpf)
  ####end
  ##end
end
