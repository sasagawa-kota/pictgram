class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 15 }
  validates :name,  length: { maximum: 15 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{8,32}+\z/
validates :password, presence: true, length: { in: 8..32 }, format: { with: VALID_PASSWORD_REGEX}
  
  has_secure_password
  end
