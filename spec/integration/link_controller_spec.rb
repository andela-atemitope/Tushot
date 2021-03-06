# require "spec_helper"

# require "rails_helper"

# RSpec.describe "User Dashboard", type: :controller do
#   subject(:user) do
#     User.create(username: "Oscar", 
#                 email: "oscillo@gmail.com " , 
#                 password: "oscarpalito", 
#                 password_confirmation: "oscarpalito")
#   end

#   subject(:link) do
#     Link.create(long_url: "http://www.thisisatest.com", 
#                 short_url: "tesla1",
#                 clicks: 3, 
#                 user_id: 2)
#   end

#   context "when user logs in to dashboard" do
#     it "the page should contain a form to shorten links"  do
#       visit "/login"

#       fill_in "email", with: user.email
#       fill_in "password", with: user.password

#       page.find("input[type='submit']").click

#       expect(page).to have_content("Welcome Oscar")

#       # expect(page).to have_selector("input#link_short_url")
#     end

#     it "the page should contain a field that enables the user type in custom keywords" do
#       visit login_path

#        fill_in "email", with: user.email
#        fill_in "password", with: user.password

#       page.find("input[type='submit']").click

#       expect(page).to have_content("Paste your long URL here:")
#       expect(page).to have_selector("input#link_short_url")
#     end

#     it "the page should display user created short links" do
#       visit "/login"

#       fill_in "email", with: user.email
#       fill_in "password", with: user.password

#       click_button "submit"

#       fill_in "link[long_url]", with: "http://givemeamacbook.com"
#       fill_in "link[short_url]", with: "macbook"

#       expect(page).to have_content("Welcome Oscar")
#       expect(page).to have_content("Old Url")
#       expect(page).to have_content("New Url")
#       expect(page).to have_content("Most Popular")
#       expect(page).to have_content("Recent")
#      # page.find(".cut").click

#      # expect(page).to have_css('div.shorturl_container')
#      visit "/dashboard"

#       expect(page).to have_content("victims and counting")

#       # expect(page).to have_http_status(200)
#       # expect(page).to have_content("macbook")y
#     end


#     end

#     it "should automatically redirect to the long_url if the short url has been assigned to another link" do 
#       link = Link.create(long_url: "http://www.futuretest.com", 
#                   short_url: "oscar", 
#                   clicks: 3, 
#                   user_id: 1) 
#       visit"#{root_url}#{link.short_url}"
#       response.code.should eq(200)
    
#     end

#   end
# end
# # end