require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

    test "should signup user with valid information" do
        get signup_path
        assert_template 'users/new'
        assert_difference 'User.count', 1 do
            post_via_redirect users_path, user: { username: "newuser", email: "newuser@example.com", password: "password" }
        end
        assert_template 'users/show'
        assert_match 'newuser', response.body
    end

end