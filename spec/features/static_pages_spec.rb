require "rails_helper"

RSpec.feature "User visits home page", :type => :feature do
  it "Displays movies titles" do
    visit "/"

    expect(page).to have_text("Movie titles")
    expect(page).to have_text("Dick Johnson Is Dead")
  end
end