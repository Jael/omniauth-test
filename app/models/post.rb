class Post < ActiveRecord::Base
  attr_accessible :content, :title, :image, :tag_list
  has_many :comments
  belongs_to :user
  has_and_belongs_to_many :tags
  acts_as_taggable
  mount_uploader :image, ImageUploader
  
end
