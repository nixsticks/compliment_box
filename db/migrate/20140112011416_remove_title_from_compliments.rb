class RemoveTitleFromCompliments < ActiveRecord::Migration
  def change
    remove_column :compliments, :title
  end
end
