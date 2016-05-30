class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #:confirmable tells the users that need to confirm his email before login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :async
  
  validate :email_is_unique, on: :create
  validate :subdomain_is_unique, on: :create
  
  after_validation :create_tenant
  after_create :create_account
  
  #Disable user confirmation via email after sing up       
  #def confirmation_required?
    #false
  #end
  
  private
  
  #Email should be unique in Account Model
  def email_is_unique
    #Do not validate email if errors are already present.
    return false unless self.errors[:email].empty?
    
    unless Account.find_by_email(email).nil?
      errors.add(:email, " is already used by another account")
    end
  end
  
  def subdomain_is_unique
    #Do not validate email if errors are already present.
    return false unless self.errors[:subdomain].empty?
    
    unless Account.find_by_subdomain(subdomain).nil?
      errors.add(:subdomain, " is already used by another account")
    end
    
    if Apartment::Elevators::Subdomain.excluded_subdomains_include?(subdomain)
      errors.add(:subdomain, " is not valid")
    end
  end
  
  def create_account
    account = Account.new(:email => email, :subdomain => subdomain)
    account.save!
  end
  
  def create_tenant
    return false unless self.errors.empty?
    Apartment::Tenant.create(subdomain)
    Apartment::Tenant.switch!(subdomain)
  end  
end
