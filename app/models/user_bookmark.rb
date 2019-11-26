class UserBookmark < ApplicationRecord
  belongs_to :learning_opportunity
  belongs_to :user
end
