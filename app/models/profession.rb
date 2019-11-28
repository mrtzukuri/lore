class Profession < ApplicationRecord
  validates :name, presence: true
  has_many :skills
end
