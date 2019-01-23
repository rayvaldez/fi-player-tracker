class User < ActiveRecord::Base
  has_many :player
  has_secure_password
  
end
