class Section < ApplicationRecord
  has_many :profiles
  has_many :messages
  has_many :events

end
