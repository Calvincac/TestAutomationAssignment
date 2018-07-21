module Oradian

    class DashboardPage < BasePage
        
        USER_BUTTON     = '.btn.dropdown-toggle'
        PROFILE_BUTTON  = '.dropdown-menu > li:nth-child(1) > a'
        USER_NAME       = 'Calvin Ávila Custódio'
        MAIN_LINKS      = '.main-menu > li' 
        DASHBOARD       = 'canvas'  
        

        def go_to_profile_page
            click_on_element(USER_BUTTON)
            click_on_element(PROFILE_BUTTON)
        end
        
        def check_left_side_links
            links = get_elements(MAIN_LINKS)
            expect(links.size).to eq(13)
        end

        def check_dashboards_quantity
            all_canvas = get_elements(DASHBOARD)
            actual_number_of_dashboards = all_canvas.size/2
            expect(actual_number_of_dashboards).to eq(4)
        end
        
    end
end

World(Oradian)