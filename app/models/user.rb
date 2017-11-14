class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :messages
  has_many :groups, through: :user_groups
  has_many :user_groups
  accepts_nested_attributes_for :groups, allow_destroy: true
end
