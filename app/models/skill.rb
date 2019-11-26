class Skill < ApplicationRecord
  belongs_to :skill_group
  has_and_belongs_to_many :learning_opportunities
end
