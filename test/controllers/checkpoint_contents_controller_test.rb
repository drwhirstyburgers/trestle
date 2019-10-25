require 'test_helper'

class CheckpointContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @checkpoint_content = checkpoint_contents(:one)
  end

  test "should get index" do
    get checkpoint_contents_url
    assert_response :success
  end

  test "should get new" do
    get new_checkpoint_content_url
    assert_response :success
  end

  test "should create checkpoint_content" do
    assert_difference('CheckpointContent.count') do
      post checkpoint_contents_url, params: { checkpoint_content: { checkpoint_id: @checkpoint_content.checkpoint_id, order: @checkpoint_content.order, text: @checkpoint_content.text, type: @checkpoint_content.type, video_url: @checkpoint_content.video_url } }
    end

    assert_redirected_to checkpoint_content_url(CheckpointContent.last)
  end

  test "should show checkpoint_content" do
    get checkpoint_content_url(@checkpoint_content)
    assert_response :success
  end

  test "should get edit" do
    get edit_checkpoint_content_url(@checkpoint_content)
    assert_response :success
  end

  test "should update checkpoint_content" do
    patch checkpoint_content_url(@checkpoint_content), params: { checkpoint_content: { checkpoint_id: @checkpoint_content.checkpoint_id, order: @checkpoint_content.order, text: @checkpoint_content.text, type: @checkpoint_content.type, video_url: @checkpoint_content.video_url } }
    assert_redirected_to checkpoint_content_url(@checkpoint_content)
  end

  test "should destroy checkpoint_content" do
    assert_difference('CheckpointContent.count', -1) do
      delete checkpoint_content_url(@checkpoint_content)
    end

    assert_redirected_to checkpoint_contents_url
  end
end
