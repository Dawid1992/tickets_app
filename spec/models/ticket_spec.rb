require 'rails_helper'

RSpec.describe Ticket, type: :model do
  subject {
    described_class.new(user_id: 1,
                        event_id: 2,
                        purchase_date: DateTime.now,
                        cancel_code: 'yr5awyfdya5wdawydf')
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a user_id" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a event_id" do
    subject.event_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a cancel_code" do
    subject.cancel_code = nil
    expect(subject).to_not be_valid
  end

end

