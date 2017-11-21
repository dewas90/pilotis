class Section < ApplicationRecord
  has_many :profiles
  has_many :messages

end
