class ChangeAmount
  def initialize(event_id,amount)
    @this_event = Event.find_by(id:event_id)
    @event_tickets_left = @this_event.amount_of_ticket
    @new_tickets_amount = @event_tickets_left - amount
    @this_event.update(amount_of_ticket:@new_tickets_amount)
  end
end
class Ticket < ApplicationRecord
  belongs_to :user ,optional: true
  belongs_to :event, optional: true

  validates :event_id, presence: true
  validates :user_id, presence: true
  validates :purchase_date, presence: true
  validates :cancel_code, presence: true
end




