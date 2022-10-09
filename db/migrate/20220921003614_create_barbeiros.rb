class CreateBarbeiros < ActiveRecord::Migration[7.0]
  def change
    create_table :barbeiros do |t|
      t.string :nome
      #t.string :cpf
      t.date :data_nascimento
      t.string :telefone
      #t.string :email

      t.timestamps
    end
  end
end
