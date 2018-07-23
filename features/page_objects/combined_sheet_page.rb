module Oradian

    class CombinedSheet < BasePage
        
        DROPDOWN_LINK       = '.fa-icon-resize-small'
        NAVBAR_OPTIONS      = '.nav.nav-tabs > li:nth-child(6) > ul > li'
        OPTION_NAME         = 'Combined Sheet'
        PAGE_SELECTOR       = '.pull-right.CombinedSheet__exportButtons--192v0'
        BRANCH_SELECT       = 'div[data-qa-element-id="organisationStructure.branch"] > div > div > span:nth-child(1)'
        BRANCH_OPTIONS      = '.VirtualizedSelectOption'
        CHOSEN_BRANCH       = 'Branch 1004'
        PAGE_BUTTONS        = '.btn.btn-primary'
        FILTER_BUTTON_TEXT  = 'Filter'
        SEARCH_RESULT       =  '.InstafinTable__instafinTable--HoRED'

        def go_to_combined_sheet_page
            click_on_element(DROPDOWN_LINK) 
            combined_sheet_link = search_for_element_in_array(OPTION_NAME, NAVBAR_OPTIONS)  
            combined_sheet_link.click         
        end 

        def check_combined_sheet_page
            page.should have_css(PAGE_SELECTOR)
        end

        def add_filters
            click_on_element(BRANCH_SELECT)
            option = search_for_element_in_array(CHOSEN_BRANCH, BRANCH_OPTIONS)
            option.click
            filter_button = search_for_element_in_array(FILTER_BUTTON_TEXT, PAGE_BUTTONS)
            filter_button.click
            page.should have_css(SEARCH_RESULT)
        end
    end
end

World(Oradian)