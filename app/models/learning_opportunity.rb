class LearningOpportunity < ApplicationRecord
  has_and_belongs_to_many :skills

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :start_date, :end_date, :price, :type, :location, :description, :url, presence: true
end

  # create_table "learning_opportunities", force: :cascade do |t|
  #   t.string "name"
  #   t.date "start_date"
  #   t.date "end_date"
  #   t.integer "price"
  #   t.string "type"
  #   t.string "location"
  #   t.text "description"
  #   t.string "url"
  #   t.string "twitter_hashtag"
  #   t.integer "duration"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.integer "time_commitment"
  # end
