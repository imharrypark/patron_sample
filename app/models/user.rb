class User < ActiveRecord::Base
  has_secure_password

  self.inheritance_column = nil
end
