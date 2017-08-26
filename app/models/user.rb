class User < ApplicationRecord
  rolify
  before_create :set_default_role

  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }

  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private
  def set_default_role
    self.add_role "member"
  end
end
