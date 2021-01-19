json.extract! event, :id, :event_name, :description, :price_by_ticket, :amount_of_ticket, :event_date, :event_time, :created_at, :updated_at
json.url event_url(event, format: :json)
