class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|

      t.timestamps
      t.integer :member_id
      t.integer :genre_id
      t.string :prefecture
      t.string :city
      t.string :title, null: false, default: ""
      t.text :body
      t.string :name, null: false, default: ""
      t.string :point, null: true, default: ""
      t.integer :time, default: "選択してください"
      t.integer :weather, default: "選択してください"
      t.integer :tide, default: "選択してください"
      t.integer :tide_updown, default: "選択してください"
      t.integer :wave, default: "選択してください"
      t.integer :light, default: "選択してください"
      t.integer :moon, default: "選択してください"
    end
  end
end
