module Oradian

    class CombinedSheet < BasePage
        
        DROPDOWN_LINK               = '.fa-icon-resize-small'
        NAVBAR_OPTIONS              = '.nav.nav-tabs > li:nth-child(6) > ul > li'
        OPTION_NAME                 = 'Combined Sheet'
        COMMON_SELECT_SELECTOR      = '> div > div > span:nth-child(1)'
        PAGE_SELECTOR               = '.pull-right.CombinedSheet__exportButtons--192v0'
        BRANCH_SELECT               = 'div[data-qa-element-id="organisationStructure.branch"] ' + COMMON_SELECT_SELECTOR
        CREDIT_OFFICER_SELECT       = 'div[data-qa-element-id="organisationStructure.creditOfficer"] ' + COMMON_SELECT_SELECTOR
        CENTRE_SELECT               = 'div[data-qa-element-id="organisationStructure.centre"] ' + COMMON_SELECT_SELECTOR
        DEPOSIT_SELECT              = 'div[data-qa-element-id="depositType"] ' + COMMON_SELECT_SELECTOR
        PRODUCTS_SELECT             = 'div[data-qa-element-id="products"] ' +  COMMON_SELECT_SELECTOR
        CLIENT_SELECT               = 'div[data-qa-element-id="clients"] ' + COMMON_SELECT_SELECTOR
        SELECT_OPTIONS              = '.VirtualizedSelectOption'
        CHOSEN_BRANCH               = 'Branch 1004'
        PAGE_BUTTONS                = '.btn.btn-primary'
        FILTER_BUTTON_TEXT          = 'Filter'
        SEARCH_RESULT               =  '.InstafinTable__instafinTable--HoRED'
        CREDIT_OFFICER_OPTION       = 'Name 1156 Surname 1156'
        CENTRE_OPTION               = 'Without Centre' 
        EXCLUDE_ARREARS_SELECTOR    = 'input[data-qa-element-id="excludeInArrears"]'
        CLEAR_DEPOSIT_SELECTOR      = 'div[data-qa-element-id="depositType"] > div > div > span:nth-child(2)'
        DATE_PICKER                 = '.DatePicker--Input'
        DATE                        = '12082018'
        RESULT_SELECTOR             = '.fixedDataTableCellGroupLayout_cellGroup'
        CLIENT_NAME                 = 'Client 1344'
        CLIENT_ID                   = '65770640'
        LINK_CELLS                  = '.Cells__clickable--2S2Yc'
        MONEY_CELLS                 = '.InstafinTable__currencyCell--3IEIT'
        
        def go_to_combined_sheet_page
            click_on_element(DROPDOWN_LINK) 
            combined_sheet_link = search_for_element_in_array(OPTION_NAME, NAVBAR_OPTIONS)  
            combined_sheet_link.click         
        end 

        def check_combined_sheet_page
            page.should have_css(PAGE_SELECTOR)
        end

        def add_filters
            add_filter_on_select_element(BRANCH_SELECT, CHOSEN_BRANCH, SELECT_OPTIONS)
            add_filter_on_select_element(CREDIT_OFFICER_SELECT, CREDIT_OFFICER_OPTION, SELECT_OPTIONS)
            add_filter_on_select_element(CENTRE_SELECT, CENTRE_OPTION, SELECT_OPTIONS)
            click_on_element(EXCLUDE_ARREARS_SELECTOR)
            click_on_element(CLEAR_DEPOSIT_SELECTOR)
            enter_text(DATE_PICKER, DATE)   
            click_on_element(PAGE_SELECTOR)         
            click_option_in_list_search(FILTER_BUTTON_TEXT, PAGE_BUTTONS)
            page.should have_css(SEARCH_RESULT)
        end

        def validate_result
            result_list = get_elements(RESULT_SELECTOR)
            actual_result = result_list.size - 1
            expect(actual_result).to eq(1)          
        end

        def validate_client_found
            if !search_for_element_in_array(CLIENT_ID, LINK_CELLS).nil? 
                client_id_found = true
            else 
                client_id_found = false 
            end
            expect(client_id_found).to be true
        end

        def validate_total_money
            total = retrieve_content_from_element(MONEY_CELLS)            
            expect(total[0].to_f).to eq(0.0)
            expect(total[1].to_f).to eq(0.0)
        end

        def check_client_profile_from_result
            client_link = search_for_element_in_array(CLIENT_NAME, LINK_CELLS)
            client_link.click
        end

    end
end

World(Oradian)