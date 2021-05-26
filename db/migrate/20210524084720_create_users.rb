class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :integer
      t.string :integer
      t.boolean :subscription

      t.timestamps
    end
  end
end
