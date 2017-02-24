class Comment < ApplicationRecord
  has_many :answers
  belongs_to :user
  belongs_to :task
  belongs_to :job 
end
