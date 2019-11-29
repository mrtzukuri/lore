class LearningOpportunity < ApplicationRecord
  has_and_belongs_to_many :skills

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :course_type, :description, :url, presence: true
  mount_uploader :event_picture, EventPictureUploader
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
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
