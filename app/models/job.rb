class Job < ApplicationRecord
  has_many :comments
  has_many :tasks
  # has_many :users, through: :tasks
  has_many :users, class_name: :User, foreign_key: :job_id


    def timestamp
      created_at.strftime('%d %B %Y %H:%M:%S')
    end

    # def description
    #   @description
    # end


end
