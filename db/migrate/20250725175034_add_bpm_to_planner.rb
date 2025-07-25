class AddBpmToPlanner < ActiveRecord::Migration[8.0]
  def change
    add_column :planners, :technique_bpm, :integer
    add_column :planners, :fretboard_bpm, :integer
    add_column :planners, :repertoire_bpm, :integer
  end
end
