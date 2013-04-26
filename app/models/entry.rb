class Entry < ActiveRecord::Base
  attr_accessible :body, :date, :tag, :title
  has_many :comments, :dependent => :destroy
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings
end
