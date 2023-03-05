class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :all_except, -> (user) { where.not(id: user) }

  has_many :expenses
  has_many :messages

  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  # to see if the new user appears without reloading the page
  after_create_commit { broadcast_append_to "users" }

  def set_default_role
    self.role ||= :user
  end
end
