class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|

      t.timestamps
      t.string :city, null: false
    end
  end
end
