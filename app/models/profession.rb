class Profession < ApplicationRecord
  has_and_belongs_to_many :skill_groups
end
