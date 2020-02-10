require "application_system_test_case"

class BugReportsTest < ApplicationSystemTestCase
  setup do
    @bug_report = bug_reports(:one)
  end

  test "visiting the index" do
    visit bug_reports_url
    assert_selector "h1", text: "Bug Reports"
  end

  test "creating a Bug report" do
    visit bug_reports_url
    click_on "New Bug Report"

    fill_in "Body", with: @bug_report.body
    fill_in "Path", with: @bug_report.path
    fill_in "Priority", with: @bug_report.priority
    fill_in "Status", with: @bug_report.status
    fill_in "Subject", with: @bug_report.subject
    click_on "Create Bug report"

    assert_text "Bug report was successfully created"
    click_on "Back"
  end

  test "updating a Bug report" do
    visit bug_reports_url
    click_on "Edit", match: :first

    fill_in "Body", with: @bug_report.body
    fill_in "Path", with: @bug_report.path
    fill_in "Priority", with: @bug_report.priority
    fill_in "Status", with: @bug_report.status
    fill_in "Subject", with: @bug_report.subject
    click_on "Update Bug report"

    assert_text "Bug report was successfully updated"
    click_on "Back"
  end

  test "destroying a Bug report" do
    visit bug_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bug report was successfully destroyed"
  end
end
