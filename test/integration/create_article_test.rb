require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest
        
    def setup
        @user = User.create(username: "newuser", email: "newuser@example.com", password: "password")
    end
    
    test "should be able to post article" do
        sign_in_as(@user, "password")
        get new_article_path
        assert_template 'articles/new'
        assert_difference 'Article.count', 1 do
            post_via_redirect articles_path, article: { title: "test-article", description: "this is a test article" }
        end
        assert_template 'articles/show'
        assert_match 'test-article', response.body
    end

end