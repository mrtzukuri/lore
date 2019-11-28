class Skill < ApplicationRecord
  belongs_to :profession
  has_and_belongs_to_many :learning_opportunities
end
