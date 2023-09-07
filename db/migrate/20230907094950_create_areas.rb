class CreateAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :areas do |t|

      t.timestamps
      t.integer :name, default: 0
    end
  end
end
