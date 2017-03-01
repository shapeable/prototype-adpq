class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :phone_number
      t.string :gender
      t.integer :year_of_birth
      t.string :lenguage
      t.boolean :email_actived
      t.boolean :sms_actived

      t.timestamps
    end
  end
end
