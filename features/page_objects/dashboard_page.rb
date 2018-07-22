module Oradian

    class DashboardPage < BasePage
        
        USER_BUTTON        = '.btn.dropdown-toggle'
        PROFILE_BUTTON     = '.dropdown-menu > li:nth-child(1) > a'
        USER_NAME          = 'Calvin Ávila Custódio'
        MAIN_LINKS         = '.main-menu > li' 
        DASHBOARD          = 'canvas'
        ACTIVITY_STREAMS   = '#activity-stream > div'
        ACTIVITY_CONTENT   = '.activity-item-summary'  
        FILTER_BUTTON      = '#filterDashboard'
        MODAL_LABEL        = '#myModalLabel' 
        

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

        def check_activity_streams
            all_activities = get_elements(ACTIVITY_STREAMS)
            expect(all_activities.size).to eq(10)
        end

        def check_activity_content
            activities_content =  get_elements(ACTIVITY_CONTENT)
            
            activities_content.each do |activity| 
                expect(activity.text).not_to be_empty
            end
        end   
        
        def add_filter
            click_on_element(FILTER_BUTTON)
            page.should have_css(MODAL_LABEL)
        end
    end
end

World(Oradian)