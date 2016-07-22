class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.integer :company_id

      t.references :company, foreign_key: true

      t.timestamps null: false
    end
  end
end
