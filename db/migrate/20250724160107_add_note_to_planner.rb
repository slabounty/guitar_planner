class AddNoteToPlanner < ActiveRecord::Migration[8.0]
  def change
    add_column :planners, :note, :string
  end
end
