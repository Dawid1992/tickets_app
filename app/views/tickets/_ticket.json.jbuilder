json.extract! ticket, :id, :user_id, :event_id, :purchase_date, :cancel_code, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
