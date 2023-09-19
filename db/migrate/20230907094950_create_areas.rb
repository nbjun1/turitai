class CreateAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :areas do |t|

      t.timestamps
      t.string :name, null: false, default: ""
    end
  end
end
