require 'rails_helper'

RSpec.describe Event, type: :model do
  subject {
    described_class.new(event_name: 'test',
                        description: 'lorem ipsum',
                        price_by_ticket:10,
                        amount_of_ticket:100,
                        event_date: DateTime.now,
                        event_time: DateTime.now,
                        city:'Test',
                        address:'Test 1/2',
                        )
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a event_name" do
    subject.event_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a price_by_ticket" do
    subject.price_by_ticket = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a amount_of_ticket" do
    subject.amount_of_ticket = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a event_date" do
    subject.event_date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a event_time" do
    subject.event_time = nil
    expect(subject).to_not be_valid
  end

end
