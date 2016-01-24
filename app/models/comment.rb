class Comment < ActiveRecord::Base
  belongs_to :message
  belongs_to :user
end

# this file serves as a testament to our join table. Long live the association...