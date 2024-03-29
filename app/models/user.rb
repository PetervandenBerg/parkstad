class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :messages, :dependent => :destroy
  has_many :events, :dependent => :destroy
  has_many :attendances, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  validates :name, presence: true

end
