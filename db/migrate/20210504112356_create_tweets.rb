class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :city, null: false
      t.string :resource, null: false

      t.timestamps
    end
  end
end
