module AuthMe
  module Entity
    def correct_password?(attempt)
      BCrypt::Password.new(encrypted_password) == attempt
    end
  end
end
