require 'test_helper'

class CheckpointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @checkpoint = checkpoints(:one)
  end

  test "should get index" do
    get checkpoints_url
    assert_response :success
  end

  test "should get new" do
    get new_checkpoint_url
    assert_response :success
  end

  test "should create checkpoint" do
    assert_difference('Checkpoint.count') do
      post checkpoints_url, params: { checkpoint: { description: @checkpoint.description, order_number: @checkpoint.order_number, section_id: @checkpoint.section_id, time_to_complete: @checkpoint.time_to_complete, title: @checkpoint.title } }
    end

    assert_redirected_to checkpoint_url(Checkpoint.last)
  end

  test "should show checkpoint" do
    get checkpoint_url(@checkpoint)
    assert_response :success
  end

  test "should get edit" do
    get edit_checkpoint_url(@checkpoint)
    assert_response :success
  end

  test "should update checkpoint" do
    patch checkpoint_url(@checkpoint), params: { checkpoint: { description: @checkpoint.description, order_number: @checkpoint.order_number, section_id: @checkpoint.section_id, time_to_complete: @checkpoint.time_to_complete, title: @checkpoint.title } }
    assert_redirected_to checkpoint_url(@checkpoint)
  end

  test "should destroy checkpoint" do
    assert_difference('Checkpoint.count', -1) do
      delete checkpoint_url(@checkpoint)
    end

    assert_redirected_to checkpoints_url
  end
end
