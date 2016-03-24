require 'rails_helper'

feature "User enters a url" do
  scenario "user enters a valid url that has not previously been bytesized" do
    visit home_page_path

    fill_in "URL:", with: "http://example.com/alotofnumbersandletters/2349898wefsdsf"
    click_button "Get Bytesize URL"

    expect(page).to have_content("You have succesfully created a BytesizeURL!")
  end

  scenario "user enters a valid url that was previously bytesized" do
    Fabricate(:url, full_url: "http://example.com/alotofnumbersandletters/2349898wefsdsf")

    visit home_page_path

    fill_in "URL:", with: "http://example.com/alotofnumbersandletters/2349898wefsdsf"
    click_button "Get Bytesize URL"

    expect(page).to have_content("We already have a BiteSizeURL for this link.  Here you go!")
  end

  scenario "user enters an invalid url" do
    visit home_page_path

    fill_in "URL:", with: "foobar"
    click_button "Get Bytesize URL"

    expect(page).to have_content("Please enter a valid URL.")
  end
end
