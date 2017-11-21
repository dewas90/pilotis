class Admin < ApplicationRecord
  belongs_to :profile
  has_many :invoices
  has_many :events
  has_many :messages

end
