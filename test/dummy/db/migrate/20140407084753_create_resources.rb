class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :subtitle
      t.string :author
      t.string :producedby
      t.string :edition
      t.text :description
      t.string :series
      t.string :controlno
      t.string :publisher
      t.date :publishdate

      t.timestamps
    end
  end
end
