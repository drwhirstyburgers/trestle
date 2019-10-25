require "application_system_test_case"

class CheckpointContentsTest < ApplicationSystemTestCase
  setup do
    @checkpoint_content = checkpoint_contents(:one)
  end

  test "visiting the index" do
    visit checkpoint_contents_url
    assert_selector "h1", text: "Checkpoint Contents"
  end

  test "creating a Checkpoint content" do
    visit checkpoint_contents_url
    click_on "New Checkpoint Content"

    fill_in "Checkpoint", with: @checkpoint_content.checkpoint_id
    fill_in "Order", with: @checkpoint_content.order
    fill_in "Text", with: @checkpoint_content.text
    fill_in "Type", with: @checkpoint_content.type
    fill_in "Video url", with: @checkpoint_content.video_url
    click_on "Create Checkpoint content"

    assert_text "Checkpoint content was successfully created"
    click_on "Back"
  end

  test "updating a Checkpoint content" do
    visit checkpoint_contents_url
    click_on "Edit", match: :first

    fill_in "Checkpoint", with: @checkpoint_content.checkpoint_id
    fill_in "Order", with: @checkpoint_content.order
    fill_in "Text", with: @checkpoint_content.text
    fill_in "Type", with: @checkpoint_content.type
    fill_in "Video url", with: @checkpoint_content.video_url
    click_on "Update Checkpoint content"

    assert_text "Checkpoint content was successfully updated"
    click_on "Back"
  end

  test "destroying a Checkpoint content" do
    visit checkpoint_contents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Checkpoint content was successfully destroyed"
  end
end
