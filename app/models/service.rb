class Service < ApplicationRecord
  has_many :agendamentos
  validates :nome, presence: true, length: {in:3..35}
  validates :valor, presence: true, length: {in:3..10}
  validates :tempo, presence: true, length: {in:1..5}
end
