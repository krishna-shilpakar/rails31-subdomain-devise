class Account < ActiveRecord::Base
  has_many :users
  validates :name, :uniqueness => {:case_sensitive => false}, :presence => true
  
  CAN_SIGN_UP = Rails.application.config.allow_account_sign_up
end
