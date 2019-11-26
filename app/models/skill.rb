class Skill < ApplicationRecord
  has_and_belongs_to_many :skill_groups
  has_and_belongs_to_many :learning_opportunities
end
