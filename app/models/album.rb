class Album < ApplicationRecord
  has_attachments :photos, maximum: 40
  belongs_to :admin
  validates :name, presence: true
  validates :photos, presence: true
end
