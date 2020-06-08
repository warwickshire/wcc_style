class AddKeywordIdToResources < ActiveRecord::Migration
  def change
    add_column :resources, :keyword_id, :integer
  end
end
