class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false
      t.string :starting_point, null: false
      t.string :ending_point, null: false
      t.datetime :request_time, null: false
      t.integer :estimated_value_cents, null: false

      t.timestamps
    end
  end
end
