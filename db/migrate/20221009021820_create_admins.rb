class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :nome
      t.string :telefone
      t.date :data_nascimento

      t.timestamps
    end
  end
end
