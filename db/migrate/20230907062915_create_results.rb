class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|

      t.timestamps
      t.integer :member_id
      t.integer :genre_id
      t.integer :area_id
      t.integer :area_detail_id
      t.string :title, null: false, default: ""
      t.text :body, null: false, default: ""
      t.string :name, null: false, default: ""
      t.string :pointt, null: true, default: ""
      t.integer :time, default: 0
      t.integer :weather, default: 0
      t.integer :tide, default: 0
      t.integer :tide_updown, default: 0
      t.integer :wave, default: 0
      t.integer :light, default: 0
      t.integer :moon, default: 0
    end
  end
end
