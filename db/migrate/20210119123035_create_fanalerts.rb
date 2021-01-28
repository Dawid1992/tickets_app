class CreateFanalerts < ActiveRecord::Migration[6.1]
  def change
    create_table :fanalerts do |t|
      t.integer :user_id
      t.integer :event_id
      t.date :create_date

      t.timestamps
    end
  end
end
