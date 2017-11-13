class Invoice < ApplicationRecord
  belongs_to :admin
  belongs_to :profile

  validates :date, presence: true
  validates :amount, presence: true
  validates :title, presence: true
  validates :bank_account, presence: true
  validates :status, presence: true
end
