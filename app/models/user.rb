require 'digest/sha2'

class User < ActiveRecord::Base
  USER_ROLE = {"administrator" => 0, "customer" => 1}
  USER_ROLE2 = {0 => "administrator", 1 => "customer"}
  validates :name, :presence => true, :uniqueness => true
  validates :role, :presence => true

  validates :password, :confirmation => true
  attr_accessor :password_confirmation
  attr_reader   :password

  validate :password_must_be_present

  after_update  :ensure_an_admin_remains
  after_destroy :ensure_an_admin_remains

  def ensure_an_admin_remains
    if User.find_all_by_role(0).empty?
      raise "Must keep at least a administrator existing !"
    end
  end


  class << self
    def authenticate(name, password)
      if user = find_by_name(name)
        if user.hashed_password == encrypt_password(password, user.salt)
          user
        end
      end
    end

    def encrypt_password(password, salt)
      Digest::SHA2.hexdigest(password + "wibble" + salt)
    end
  end

  def password=(password)
    @password = password

    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end

  private

  def password_must_be_present
    errors.add(:password, "Missing password") unless hashed_password.present?
  end

  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
end
