class UpdateColumnNameInUrls < ActiveRecord::Migration
  def change
    rename_column :urls, :short_url, :path
  end
end
