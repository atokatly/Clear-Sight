class User < ApplicationRecord
  has_secure_password
  belongs_to :business
  has_many :comments
  has_many :tasks
  has_many :answers
  # has_many :jobs, through: :tasks
  has_many :jobs, class_name: :Job, foreign_key: :user_id
end
