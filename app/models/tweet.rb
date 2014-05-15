class Tweet < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :zombie
  
  
  validates :status, presence: true
  validates :name, presence: true
  
  
end
