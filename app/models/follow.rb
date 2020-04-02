class Follow < ApplicationRecord
  # Model associations
  belongs_to :author, class_name: "User"
  belongs_to :follower, class_name: "User"
end
