class Message < ApplicationRecord
  validates :subject, presence: true
  validates :body, presence: true

  attr_accessor :section

  belongs_to :admin
  belongs_to :profile
  belongs_to :section

end
