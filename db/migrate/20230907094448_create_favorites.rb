class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|

      t.timestamps
      t.integer :member_id
      t.integer :result_id
    end
  end
end
