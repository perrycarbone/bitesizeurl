class AddDefaultToTimesVisited < ActiveRecord::Migration
  def change
    change_column :urls, :times_visited, :integer, :default => 0
  end
end
