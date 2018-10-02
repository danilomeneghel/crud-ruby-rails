require 'test_helper'

class SectorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sector = sectors(:one)
  end

  test "should get index" do
    get sectors_url
    assert_response :success
  end

  test "should get new" do
    get new_sector_url
    assert_response :success
  end

  test "should create sector" do
    assert_difference('Sector.count') do
      post sectors_url, params: { sector: { name: @sector.name } }
    end

    assert_redirected_to sector_url(Sector.last)
  end

  test "should show sector" do
    get sector_url(@sector)
    assert_response :success
  end

  test "should get edit" do
    get edit_sector_url(@sector)
    assert_response :success
  end

  test "should update sector" do
    patch sector_url(@sector), params: { sector: { name: @sector.name } }
    assert_redirected_to sector_url(@sector)
  end

  test "should destroy sector" do
    assert_difference('Sector.count', -1) do
      delete sector_url(@sector)
    end

    assert_redirected_to sectors_url
  end
end
