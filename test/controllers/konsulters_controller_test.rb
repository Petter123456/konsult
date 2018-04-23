require 'test_helper'

class KonsultersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @konsulter = konsulters(:one)
  end

  test "should get index" do
    get konsulters_url
    assert_response :success
  end

  test "should get new" do
    get new_konsulter_url
    assert_response :success
  end

  test "should create konsulter" do
    assert_difference('Konsulter.count') do
      post konsulters_url, params: { konsulter: { name: @konsulter.name } }
    end

    assert_redirected_to konsulter_url(Konsulter.last)
  end

  test "should show konsulter" do
    get konsulter_url(@konsulter)
    assert_response :success
  end

  test "should get edit" do
    get edit_konsulter_url(@konsulter)
    assert_response :success
  end

  test "should update konsulter" do
    patch konsulter_url(@konsulter), params: { konsulter: { name: @konsulter.name } }
    assert_redirected_to konsulter_url(@konsulter)
  end

  test "should destroy konsulter" do
    assert_difference('Konsulter.count', -1) do
      delete konsulter_url(@konsulter)
    end

    assert_redirected_to konsulters_url
  end
end
