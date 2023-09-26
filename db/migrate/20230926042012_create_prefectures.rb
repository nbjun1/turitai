class CreatePrefectures < ActiveRecord::Migration[6.1]
  def change
    create_table :prefectures do |t|

      t.timestamps
      t.string :prefecture, null: false
    end
  end
end
