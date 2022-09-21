class Agendamento < ApplicationRecord
  belongs_to :barbeiro
  belongs_to :cliente

  validates :horario, presence: true
  validates :barbeiro_id, presence: true
  validates :cliente_id, presence: true
end
