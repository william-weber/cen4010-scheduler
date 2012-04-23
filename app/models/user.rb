class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :n_number, :presence => true, :uniqueness => true, :format => { :with => /\An\d{8}\z/, :message => "Invalid N number" }
  validates :first_name, :presence => true
  validates :last_name, :presence => true

  belongs_to :degree_program

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :n_number, :first_name, :last_name

  def full_name
    "#{first_name} #{last_name}"
  end
end
