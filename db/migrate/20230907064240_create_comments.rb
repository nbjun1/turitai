class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.timestamps
      t.integer :member_id
      t.integer :result_id
      t.text :comment
    end
  end
end
