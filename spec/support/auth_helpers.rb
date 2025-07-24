module AuthHelpers
  def signup_and_login(email: "user@example.com", password: "password123")
    post signup_path, params: {
      user: {
        email_address: email,
        password: password,
        password_confirmation: password
      }
    }
    follow_redirect!
    User.find_by(email_address: email)
  end

  def login_user(user, password: "password123")
    post login_path, params: {
      email_address: user.email_address,
      password: password
    }
    follow_redirect!
  end
end
