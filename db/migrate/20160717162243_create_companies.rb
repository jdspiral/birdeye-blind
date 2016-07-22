class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :facebook
      t.string :google
      t.string :password_digest
      t.string :twilio_phone
      t.timestamps null: false
    end
  end
end
