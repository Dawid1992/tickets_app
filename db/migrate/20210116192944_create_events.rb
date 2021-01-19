class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :description
      t.integer :price_by_ticket
      t.integer :amount_of_ticket
      t.date :event_date
      t.time :event_time

      t.timestamps
    end
  end
end
