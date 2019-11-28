class Skill < ApplicationRecord
  has_and_belongs_to_many :profession
  has_and_belongs_to_many :learning_opportunities
end
