class Invoice < ApplicationRecord
  belongs_to :admin
  belongs_to :profile
end
