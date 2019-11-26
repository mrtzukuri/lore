class SkillGroup < ApplicationRecord
  has_and_belongs_to_many :professions
  has_and_belongs_to_many :skills
end
