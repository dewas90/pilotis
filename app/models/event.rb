class Event < ApplicationRecord
  belongs_to :admin
  belongs_to :invoice, optional: true
  has_many :attendees

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :admin_id, presence: true

end
