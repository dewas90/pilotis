class Invoice < ApplicationRecord
  include PgSearch
  pg_search_scope :global_search, against: [ :title, :date, :status], associated_against: { profile: [ :first_name, :last_name ] }

  belongs_to :admin
  belongs_to :profile

  validates :date, presence: true
  validates :amount, presence: true
  validates :title, presence: true
  validates :bank_account, presence: true
  validates :status, presence: true

end
