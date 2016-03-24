class RenamePathColumnInUrls < ActiveRecord::Migration
  def change
    rename_column :urls, :path, :short_path
  end
end
