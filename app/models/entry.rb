class Entry < ActiveRecord::Base
  attr_accessible :body, :date, :tag, :title
end
