class Profile < ApplicationRecord
  belongs_to :user
  has_many :invoices
  has_one :admin
  has_many :messages
  belongs_to :section

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :phone_number, presence: true
end
