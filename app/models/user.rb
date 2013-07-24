class User < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true
  validates :password_hash, presence: true

  include BCrypt

  # Password getter
  def password
    password ||= Password.new(password_hash)
  end

  # Password setter
  def password=(new_password)
    password = Password.create(new_password)
    self.password_hash = password
  end

  # Create function that accounts for password encryption
  def self.create(params)
    user = User.new(
    	name: params[:name],
    	email: params[:email])
    user.password = params[:password]
    user.save
    user
  end

end
