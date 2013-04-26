class Tagging < ActiveRecord::Base
  attr_accessible :entry_id, :tag, :tag_id
  belongs_to :entry
  belongs_to :tag
end
