class CreateAreaDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :area_details do |t|

      t.timestamps
      t.integer :detail_name, default: 0
    end
  end
end
