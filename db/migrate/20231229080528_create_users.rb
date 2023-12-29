class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :title, null: false
      t.text :body
      t.date :day
      t.timestamps
    end
  end
end
