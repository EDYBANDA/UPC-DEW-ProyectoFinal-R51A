class Band < ActiveRecord::Base
  attr_accessible :name, :user_id, :band_style_id
  belongs_to :band_style
  has_many :band_members
  has_many :users, :through => :band_members
end
