class Event < ApplicationRecord
  belongs_to :admin
  belongs_to :invoice, optional: true
  has_many :attendees
  belongs_to :profiles
  belongs_to :section

  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :admin_id, presence: true

end
