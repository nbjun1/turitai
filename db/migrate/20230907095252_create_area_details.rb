class CreateAreaDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :area_details do |t|

      t.timestamps
      t.string :detail_name, null: false, default: ""
    end
  end
end
