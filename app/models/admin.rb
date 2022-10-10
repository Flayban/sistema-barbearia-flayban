class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nome, presence: true, numericality: false, length: {in: 5..40},
            format: { with: /\A[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+\z/}
  validates :telefone, presence: true, numericality: true, length: { is: 11 }
  validate :data_nascimento_valida

  def data_nascimento_valida
    if data_nascimento.present? && data_nascimento > Time.zone.today
      errors.add(:data, "não pode ser no futuro")
    end
  end
end
