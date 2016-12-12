class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  def self.authenticate(email, password)
    User.find_by(email: email, password: password)
  end
end
