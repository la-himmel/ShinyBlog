class Tag < ActiveRecord::Base
  attr_accessible :body
  has_many :taggings, :dependent => :destroy
  has_many :entries, :through => :taggings
end
