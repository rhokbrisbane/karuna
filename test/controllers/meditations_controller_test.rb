require 'test_helper'

class MeditationsControllerTest < ActionController::TestCase
  setup do
    @meditation = meditations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meditations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meditation" do
    assert_difference('Meditation.count') do
      post :create, meditation: { description: @meditation.description, media_url: @meditation.media_url, name: @meditation.name }
    end

    assert_redirected_to meditation_path(assigns(:meditation))
  end

  test "should show meditation" do
    get :show, id: @meditation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meditation
    assert_response :success
  end

  test "should update meditation" do
    patch :update, id: @meditation, meditation: { description: @meditation.description, media_url: @meditation.media_url, name: @meditation.name }
    assert_redirected_to meditation_path(assigns(:meditation))
  end

  test "should destroy meditation" do
    assert_difference('Meditation.count', -1) do
      delete :destroy, id: @meditation
    end

    assert_redirected_to meditations_path
  end
end
