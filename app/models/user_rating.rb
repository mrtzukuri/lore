class UserRating < ApplicationRecord
  belongs_to :user
  belongs_to :learning_opportunity
end
