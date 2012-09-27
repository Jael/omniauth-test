class User < ActiveRecord::Base
  attr_accessible :email, :nickname, :password, :password_confirmation 
  has_many :authentications
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password, :on => :create
  accepts_nested_attributes_for :authentications
  has_secure_password

  def add_auth(auth)
    authentications.create(:provider => auth[:provider], :uid => auth[:uid])
  end
 class << self
  def new_user(auth)
    if User.find_by_email(auth[:info][:email])
      a = false 
    else
      a = true
    end
  end
    def from_auth(auth)
      locate_auth(auth) || locate_email(auth) || create_user(auth)      
    end
    def locate_auth(auth)
      Authentication.find_by_provider_and_uid(auth[:provider], auth[:uid]).try(:user)
    end
    def locate_email(auth)
      user = find_by_email(auth[:info][:email])
      return unless user
      user.add_auth(auth)
      user
    end

    def create_user(auth)
      user = create!(
           :nickname => auth[:info][:nickname], 
           :email => auth[:info][:email],
           :password => Time.now.to_s )
      user.authentications.build(provider: auth[:provider],
                                 uid: auth[:uid])
      user
    end
  end
end
