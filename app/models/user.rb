class User < ApplicationRecord
  has_secure_password
  belongs_to :business 
  has_many :comments
  has_many :tasks
  has_many :jobs, through: :tasks
end
