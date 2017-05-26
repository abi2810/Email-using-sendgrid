require 'test_helper'

class UserMailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_mail = user_mails(:one)
  end

  test "should get index" do
    get user_mails_url
    assert_response :success
  end

  test "should get new" do
    get new_user_mail_url
    assert_response :success
  end

  test "should create user_mail" do
    assert_difference('UserMail.count') do
      post user_mails_url, params: { user_mail: { email: @user_mail.email, login: @user_mail.login, name: @user_mail.name } }
    end

    assert_redirected_to user_mail_url(UserMail.last)
  end

  test "should show user_mail" do
    get user_mail_url(@user_mail)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_mail_url(@user_mail)
    assert_response :success
  end

  test "should update user_mail" do
    patch user_mail_url(@user_mail), params: { user_mail: { email: @user_mail.email, login: @user_mail.login, name: @user_mail.name } }
    assert_redirected_to user_mail_url(@user_mail)
  end

  test "should destroy user_mail" do
    assert_difference('UserMail.count', -1) do
      delete user_mail_url(@user_mail)
    end

    assert_redirected_to user_mails_url
  end
end
