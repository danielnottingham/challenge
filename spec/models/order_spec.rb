require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:starting_point) }
    it { is_expected.to validate_presence_of(:ending_point) }
    it { is_expected.to validate_presence_of(:request_time) }
    it { is_expected.to validate_presence_of(:estimated_value_cents) }

    it { is_expected.to validate_numericality_of(:estimated_value_cents).is_greater_than(0) }
  end
end
