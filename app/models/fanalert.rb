class CheckReminder
  def initialize(event_id, user_id)
    @this_reminder = Fanalert.find_by(event_id: event_id)
    @event_tickets_left = @this_event.amount_of_ticket
    @new_tickets_amount = @event_tickets_left - amount
    @this_event.update(amount_of_ticket: @new_tickets_amount)
  end
end

class Fanalert < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event, optional: true
end
