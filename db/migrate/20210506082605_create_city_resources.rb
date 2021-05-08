class CreateCityResources < ActiveRecord::Migration[6.0]
  def change
    create_table :city_resources, id: false do |t|
      t.integer :city_id
      t.integer :resource_id
      t.timestamps
    end
  end
end
