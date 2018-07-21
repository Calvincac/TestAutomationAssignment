module Oradian

    class DashboardPage < BasePage
        
        USER_BUTTON = '.btn.dropdown-toggle'

        

        def got_to_profile_page
            click_on_element(USER_BUTTON)
            byebug
        end


       
    end
end

World(Oradian)