class CreatePlanner < ActiveRecord::Migration[8.0]
  def change
    create_table :planners do |t|
      t.references :user, null: false, foreign_key: true
      t.date :start_date
      t.string :technique
      t.string :fretboard
      t.string :repertoire

      t.timestamps
    end
  end
end
