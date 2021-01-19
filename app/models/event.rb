
class Event < ApplicationRecord
  has_many :ticket, dependent: :destroy
  validates :event_name, presence: true
  validates :description, presence: true
  validates :price_by_ticket, presence: true
  validates :amount_of_ticket, presence: true
  validates :event_time, presence: true
  validates :event_date, presence: true
end
class AboutEvent
  # attr_accessor :event_id
  def initialize(event_id)
    @about_event = Event.where(id:event_id)
  end
end
