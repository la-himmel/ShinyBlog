class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.text :body
      t.text :tag
      t.date :date

      t.timestamps
    end
  end
end
