class Order < ApplicationRecord
  belongs_to :user

  validates :starting_point, presence: true
  validates :ending_point, presence: true
  validates :request_time, presence: true
  validates :estimated_value_cents, presence: true

  validates :estimated_value_cents, numericality: { greater_than: 0 }
end
