unless Rails.env.production?
  user1_attrs = { email: "user@example.com", password: "password", password_confirmation: "password" }
  user1 = User.where(email: user1_attrs[:email]).first_or_create! user1_attrs

  user2_attrs = { email: "user2@example.com", password: "password", password_confirmation: "password" }
  user2 = User.where(email: user2_attrs[:email]).first_or_create! user2_attrs
end
