
login_page     = Oradian::LoginPage.new
dashboard_page = Oradian::DashboardPage.new
profile_page   = Oradian::ProfilePage.new
client_page    = Oradian::ClientPage.new
combined_page  = Oradian::CombinedSheet.new

Given("an Oradian customer opens the login page") do
    login_page.visit_login_page
end

When("the user logs in") do
    login_page.validate_input_fields
    login_page.enter_incorrect_information
    login_page.enter_correct_details
end

And("the user expects to see the dashboard page") do
    login_page.check_dashboard
end

And("the user clicks on user button on dashboard") do
    dashboard_page.go_to_profile_page
end

And("the user expects to see profile page") do
    profile_page.check_user_name
end

And("the user checks the main buttons on the left side of the page") do
    dashboard_page.check_left_side_links
end

And("the user checks the number of dashboards on the page") do
    dashboard_page.check_dashboards_quantity
end

And("the user tries searching for a client on the search field") do
    dashboard_page.search_client
end

And("the user adds the filter rules") do
    dashboard_page.add_filter    
end

And("the user expects to see the information filtered") do
    dashboard_page.check_filter_added
end

And("the user clicks on back") do
    dashboard_page.go_back
end

Then("the user expects to see the client page") do
    client_page.check_client_page
end

Then("the user sees the latest activity stream") do
    dashboard_page.check_activity_streams
    dashboard_page.check_activity_content
end

And("the user clicks on combined sheet link") do
    combined_page.go_to_combined_sheet_page
end

And("the user expects to see combined sheet page") do
    combined_page.check_combined_sheet_page
end

And("the user searches for a specific combined sheet") do
    combined_page.add_filters
end

