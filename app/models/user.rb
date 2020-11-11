class User < ActiveRecord::Base
    has_secure_password
  
    validates :name, :bio, :image_url, :email, presence: true
    
    has_many :posts
  
  end