
login_page = Oradian::LoginPage.new

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

