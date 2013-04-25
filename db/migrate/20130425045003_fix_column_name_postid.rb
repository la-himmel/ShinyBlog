class FixColumnNamePostid < ActiveRecord::Migration  
  def up
    rename_column :comments, :post_id, :entry_id
  end

  def down
  	rename_column :comments, :entry_id, :post_id
  end
end
