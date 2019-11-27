class Profession < ApplicationRecord
  validates :name, presence: true
  has_and_belongs_to_many :skill_groups
end
