class UserTest < ActiveSupport::TestCase
  def test_allows_valid_users
    user = User.new({
      email: 'allows_valid_users@example.com',
      password: 'password',
      password_confirmation: 'password',
    })

    user.valid?.must_equal true
  end
end
