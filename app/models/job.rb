class Job < ApplicationRecord
  has_many :comments
  has_many :tasks
  has_many :users, through: :tasks 
end
