class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :event_id
      t.date :purchase_date
      t.string :cancel_code

      t.timestamps
    end
  end
end
