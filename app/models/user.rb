class User < ActiveRecord::Base
  
  has_and_belongs_to_many :roles
  
  before_validation :do_not_change_root
  before_destroy :do_not_delete_root
  
  validates_presence_of :username
  validates_length_of :username, :minimum => 3
  validates_uniqueness_of :username
  validates_presence_of :encrypted_password
  validates_presence_of :salt, :message => "needs to be set"
  
  attr_accessor :password, :old_password
  attr_accessor :admin_username, :admin_password
  
  def password=(pwd)
    @password = pwd
    if pwd.present?
      self.encrypted_password = self.class.encrypt_password(@password, self.generate_salt)
    else
      self.encrypted_password = nil
    end
  end
  
  def password
    @password
  end
  
  def has_role(role)
    return nil if self.roles.nil?
    self.roles.collect{|r|r.id}.include? role.id
  end
  
  def authenticate?(new_password)
    self.class.encrypt_password(new_password, self.salt) == self.encrypted_password
  end
  
  def is_admin?
    return nil if self.roles.nil?
    self.roles.collect{|r|r.rolename}.include? "admin"
  end

protected
  def generate_salt
    self.salt = (self.object_id.to_s + rand.to_s) unless self.salt
    self.salt
  end

private

  def self.encrypt_password(password, salt) 
    Digest::SHA2.hexdigest(password + "spm1" + salt)
  end
  
  def do_not_change_root
    self.errors.add(:base, "Cannot change the root user") if self.username == "root"
  end
  
  def do_not_delete_root
    if self.username == "root"
      self.errors.add(:base, "Cannot delete the root user") 
      return false
    end
  end
  
end
