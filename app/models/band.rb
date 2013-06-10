class Band < ActiveRecord::Base
	attr_accessible :user_ids, :user_id, :name, :band_style_id 
  belongs_to :band_style
  has_many :band_members
  has_many :users, :through => :band_members
end
