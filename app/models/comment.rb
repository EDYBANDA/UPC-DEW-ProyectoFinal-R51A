class Comment < ActiveRecord::Base
  attr_accessible :comment, :concert_id, :score, :user_id
  validates_presence_of :comment, :score
  belongs_to :users
  has_many :comments
  belongs_to :concerts
 
end
