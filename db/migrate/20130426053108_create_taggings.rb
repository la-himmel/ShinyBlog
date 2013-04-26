class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :entry_id
      t.string :tag

      t.timestamps
    end
  end
end
