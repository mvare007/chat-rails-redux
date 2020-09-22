class User < ApplicationRecord
  attr_writer :login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages

  validates :nickname, presence: true, uniqueness: [true, { case_sensitive: false }]

  def email_required?
    false
  end

  def login
    @login || self.nickname
  end

def self.find_for_database_authentication(warden_conditions)
  status = 'active'
  where(:nickname => warden_conditions[:nickname], :record_status => warden_conditions[:status]).first
end
end
