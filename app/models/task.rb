class Task < ApplicationRecord
  belongs_to :user
  belongs_to :job
  has_many :comments 
end
