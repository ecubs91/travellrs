class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :trips
  has_many :comments
  
  acts_as_messageable
  def name
    email
  end

  def mailboxer_email(object)
    email
  end
end
