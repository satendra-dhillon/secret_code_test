class User < ApplicationRecord
  rolify
  resourcify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :assign_default_role
  belongs_to :secret_code

  def assign_default_role
    self.add_role(:common) if self.roles.blank?
  end

end
