class Payment < ApplicationRecord
  belongs_to :card
  has_one :user, through: :card
end
