class User < ApplicationRecord
  authenticates_with_sorcery!

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true
    validates :password, presence: true
    validates :password, confirmation: true
end
