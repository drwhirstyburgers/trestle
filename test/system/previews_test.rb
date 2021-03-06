require "application_system_test_case"

class PreviewsTest < ApplicationSystemTestCase
  setup do
    @preview = previews(:one)
  end

  test "visiting the index" do
    visit previews_url
    assert_selector "h1", text: "Previews"
  end

  test "creating a Preview" do
    visit previews_url
    click_on "New Preview"

    fill_in "Blurb", with: @preview.blurb
    fill_in "Course", with: @preview.course_id
    click_on "Create Preview"

    assert_text "Preview was successfully created"
    click_on "Back"
  end

  test "updating a Preview" do
    visit previews_url
    click_on "Edit", match: :first

    fill_in "Blurb", with: @preview.blurb
    fill_in "Course", with: @preview.course_id
    click_on "Update Preview"

    assert_text "Preview was successfully updated"
    click_on "Back"
  end

  test "destroying a Preview" do
    visit previews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Preview was successfully destroyed"
  end
end
