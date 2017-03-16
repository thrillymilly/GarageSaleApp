class User < ActiveRecord::Base
  has_secure_password

  has_many :lost_pets


end
