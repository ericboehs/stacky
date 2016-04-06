require 'test_helper_integration'

class UserSignUpAndInTest < ActionDispatch::IntegrationTest
  def test_signs_up_for_an_account
    visit new_user_registration_path

    fill_in 'Email', with: 'user_auth_test@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'

    page.has_content?("signed up").must_equal true
  end

  def test_signs_in_to_an_account
    visit new_user_session_path

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Sign in'

    page.has_content?("Signed in").must_equal true
  end
end
