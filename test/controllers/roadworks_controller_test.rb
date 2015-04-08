require 'test_helper'

class RoadworksControllerTest < ActionController::TestCase
  setup do
    @roadwork = roadworks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roadworks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create roadwork" do
    assert_difference('Roadwork.count') do
      post :create, roadwork: { description: @roadwork.description, enddate: @roadwork.enddate, latitude: @roadwork.latitude, longitude: @roadwork.longitude, startdate: @roadwork.startdate, submitteddate: @roadwork.submitteddate, tags: @roadwork.tags }
    end

    assert_redirected_to roadwork_path(assigns(:roadwork))
  end

  test "should show roadwork" do
    get :show, id: @roadwork
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @roadwork
    assert_response :success
  end

  test "should update roadwork" do
    patch :update, id: @roadwork, roadwork: { description: @roadwork.description, enddate: @roadwork.enddate, latitude: @roadwork.latitude, longitude: @roadwork.longitude, startdate: @roadwork.startdate, submitteddate: @roadwork.submitteddate, tags: @roadwork.tags }
    assert_redirected_to roadwork_path(assigns(:roadwork))
  end

  test "should destroy roadwork" do
    assert_difference('Roadwork.count', -1) do
      delete :destroy, id: @roadwork
    end

    assert_redirected_to roadworks_path
  end
end
