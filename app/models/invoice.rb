class Invoice < ApplicationRecord
  include PgSearch
  pg_search_scope :global_search, against: [ :title, :date, :status], associated_against: { profile: [ :first_name, :last_name ] }
  attr_accessor :section
  belongs_to :admin
  belongs_to :profile
  has_one :event

  validates :title, presence: true
  validates :date, presence: true
  validates :due_date, presence: true
  validates :amount, presence: true
  validates :bank_account, presence: true
  validates :status, presence: true

end
