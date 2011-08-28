class User < ActiveRecord::Base
  
  has_and_belongs_to_many :roles
  
  validates_presence_of :username
  validates_length_of :username, :minimum => 3
  validates_presence_of :encrypted_password
  validates_presence_of :salt
  
  attr_accessor :password
  
  def password=(pwd)
    @password = pwd
    if pwd.present?
      self.encrypted_password = self.class.encrypt_number(@password, generate_salt)
    else
      self.encrypted_password = nil
    end
  end
  
  def password
    @password
  end
  
private

  def self.encrypt_number(number, salt) 
    Digest::SHA2.hexdigest(number + "spm1" + salt)
  end
  
  def generate_salt
    self.salt = (self.object_id.to_s + rand.to_s) unless self.salt
  end
  
end
