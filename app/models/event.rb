
class Event < ApplicationRecord
  has_many :ticket, dependent: :destroy
  has_many :fanalert, dependent: :destroy
  validates :event_name, presence: true
  validates :description, presence: true
  validates :price_by_ticket, presence: true
  validates :amount_of_ticket, presence: true
  validates :event_time, presence: true
  validates :event_date, presence: true
end
# formatowanie: puste linijki między klasami, zero pustych linijek na początku i końcu etc.
class AboutEvent
  # na commitach nie zostawiaj wykomentowanych rzeczy ###
  # attr_accessor :event_id
  def initialize(event_id)
    @about_event = Event.where(id:event_id)
  end
end
