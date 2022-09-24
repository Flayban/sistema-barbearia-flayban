class Agendamento < ApplicationRecord
  belongs_to :barbeiro
  belongs_to :cliente

  validates :cliente_id, :barbeiro_id, :inicioAtendimento, presence: true
  validates :inicioAtendimento, :fimAtendimento, uniqueness: true

  validate :horarioDeAbrir?, :horarioDeAlmoco?, :horarioQueFecha?,

    def horarioDeAbrir?
      if !inicioAtendimento.nil? && inicioAtendimento.hour <= 8
        errors.add :inicioAtendimento, 'Horario indisponivel, barbearia abre as 8hrs'
      end
    end

  def horarioDeAlmoco?
    if !inicioAtendimento.nil? && inicioAtendimento.hour >=12 && inicioAtendimento.hour < 13
      errors.add :inicioAtendimento, 'Horario de almoço das 12hrs as 13hrs'
    end
  end

  def horarioQueFecha?
    if !inicioAtendimento.nil? && inicioAtendimento.hour >= 18
      errors.add :inicioAtendimento, 'Barbearia fechada as 18hrs'
    end
  end

end
