class CreateLearningOpportunities < ActiveRecord::Migration[5.2]
  def change
    create_table :learning_opportunities do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :price
      t.string :type
      t.string :location
      t.text :description
      t.string :rl
      t.string :twitter_hashtag
      t.integer :duration

      t.timestamps
    end
  end
end
