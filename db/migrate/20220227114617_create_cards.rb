class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|

      t.string :holder_name
      t.string :expiry_month
      t.string :expiry_year
      t.string :card_no
      t.text :token
      t.float :available_balance, default: 100
      t.boolean :is_default, default: false
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
