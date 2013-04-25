class Entry < ActiveRecord::Base
  attr_accessible :body, :date, :tag, :title
  has_many :comments, :dependent => :destroy
end
