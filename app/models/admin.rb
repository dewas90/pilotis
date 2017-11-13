class Admin < ApplicationRecord
  belongs_to :profile
  has_many :invoices
end
