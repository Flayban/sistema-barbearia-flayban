require 'phonelib'
class Cliente < ApplicationRecord

  has_many :agendamentos, :dependent => :destroy
  ##has_many :barbeiros, through: :agendamentos

  validates :nome, presence: true, length: {in:3..35}, format: {with: /\A[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+\z/ }
  validates :telefone, phone: { possible: true, allow_blank: false , types: [:voip, :mobile], }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP}
  validate :nascimento_valido

  def nascimento_valido
    if data_nascimento.present? && data_nascimento > Time.zone.today
      errors.add(:data_nascimento, ': Data de nascimento invalida')
    end
  end
end
