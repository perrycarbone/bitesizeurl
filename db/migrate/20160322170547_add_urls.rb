class AddUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :full_url
      t.string :short_url
      t.integer :times_visited

      t.timestamps
    end
  end
end
