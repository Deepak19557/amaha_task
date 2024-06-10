class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :desc
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.datetime :deadline

      t.timestamps
    end
  end
end
