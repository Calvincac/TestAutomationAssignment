module Oradian

    class DashboardPage < BasePage
        
        USER_BUTTON     = '.btn.dropdown-toggle'
        PROFILE_BUTTON  = '.dropdown-menu > li:nth-child(1) > a'
        USER_NAME       = 'Calvin Ávila Custódio'
        

        def go_to_profile_page
            click_on_element(USER_BUTTON)
            click_on_element(PROFILE_BUTTON)
        end       
    end
end

World(Oradian)