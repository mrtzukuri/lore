class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Model Validations
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, :city, :name, presence: true

  # Model Associations
  belongs_to :profession
  has_many :skill_groups, through: :profession
end

#   create_table "users", force: :cascade do |t|
#     t.string "email", default: "", null: false
#     t.string "encrypted_password", default: "", null: false
#     t.string "reset_password_token"
#     t.datetime "reset_password_sent_at"
#     t.datetime "remember_created_at"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.bigint "profession_id"
#     t.string "city"
#     t.index ["email"], name: "index_users_on_email", unique: true
#     t.index ["profession_id"], name: "index_users_on_profession_id"
#     t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
#   end
