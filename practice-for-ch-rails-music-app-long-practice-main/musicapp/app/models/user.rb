# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    before_validation :ensure_session_token
    validates :email, :password_digest, :session_token, presence: :true
    validates :email, :session_token, uniqueness: :true
    
    attr_reader :password

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        passObj = BCrypt::Password.new(password_digest)
        passObj.is_password?(password)
    end

    def self.find_by_credentials(email, password)
        @user = User.find_by(email: email)
        if @user&.is_password?(password)
            return @user
        else
            return nil
        end
    end

    def generate_unique_session_token
        self.session_token = SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        generate_unique_session_token
        self.save! 
        self.session_token 
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

end
