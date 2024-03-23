require "test_helper"

class Admin::DogRunsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_dog_runs_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_dog_runs_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_dog_runs_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_dog_runs_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_dog_runs_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_dog_runs_update_url
    assert_response :success
  end
end
