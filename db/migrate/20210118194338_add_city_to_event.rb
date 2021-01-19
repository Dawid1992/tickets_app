class AddCityToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :city, :string, default: ''
    add_column :events, :address, :string, default: ''
  end
end
