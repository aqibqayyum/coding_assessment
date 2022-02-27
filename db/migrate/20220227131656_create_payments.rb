class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :card_id, foreign_key: true
      t.float :amount
      t.text :reason

      t.timestamps
    end
  end
end
