require "application_system_test_case"

class CheckpointsTest < ApplicationSystemTestCase
  setup do
    @checkpoint = checkpoints(:one)
  end

  test "visiting the index" do
    visit checkpoints_url
    assert_selector "h1", text: "Checkpoints"
  end

  test "creating a Checkpoint" do
    visit checkpoints_url
    click_on "New Checkpoint"

    fill_in "Description", with: @checkpoint.description
    fill_in "Section", with: @checkpoint.section_id
    fill_in "Time to complete", with: @checkpoint.time_to_complete
    fill_in "Title", with: @checkpoint.title
    click_on "Create Checkpoint"

    assert_text "Checkpoint was successfully created"
    click_on "Back"
  end

  test "updating a Checkpoint" do
    visit checkpoints_url
    click_on "Edit", match: :first

    fill_in "Description", with: @checkpoint.description
    fill_in "Section", with: @checkpoint.section_id
    fill_in "Time to complete", with: @checkpoint.time_to_complete
    fill_in "Title", with: @checkpoint.title
    click_on "Update Checkpoint"

    assert_text "Checkpoint was successfully updated"
    click_on "Back"
  end

  test "destroying a Checkpoint" do
    visit checkpoints_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Checkpoint was successfully destroyed"
  end
end
