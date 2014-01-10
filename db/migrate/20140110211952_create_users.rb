class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      add_index :email, unique: true

      t.timestamps
    end
  end
end
