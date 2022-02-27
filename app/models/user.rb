class User < ApplicationRecord

 devise :database_authenticatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :blogs
  has_many :cards
  has_many :payments, through: :cards

end
