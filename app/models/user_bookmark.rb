class UserBookmark < ApplicationRecord
  belongs_to :learning_opportunity
  belongs_to :user

  # Validations
  # validates :user #, presence: true
  validates :learning_opportunity, presence: true, uniqueness: { scope: :user,
    message: "can only be bookmarked once" }
end
