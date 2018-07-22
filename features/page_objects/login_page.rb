
module Oradian

    class LoginPage < BasePage
        
        USERNAME_FIELD       = '#us1'
        WRONG_USERNAME_TEXT  = 'test'
        PASSWORD_FIELD       = '#pw1'
        WRONG_PASSWORD_TEXT  = 'pass'
        SIGNIN_BUTTON        = '.btn.btn-large.btn-primary'
        DASHBOARD_SELECTOR   = '.dashboard-item-content'
        ERROR_MESSAGE        = '.fm_error_msg'
        USERNAME             = 'calvin'
        PASSWORD             = 'kreso123!'
        URL                  = 'https://qaecalvin.instafin.info'
        DASHBOARD_LOADER     = '#ajaxBusy'

        def visit_login_page
            visit(URL)
        end

        def validate_input_fields
            enter_text(USERNAME_FIELD, WRONG_USERNAME_TEXT)
            click_on_element(SIGNIN_BUTTON)
            expect(page).to have_no_css(DASHBOARD_SELECTOR)
            clear_input(USERNAME_FIELD)

            enter_text(PASSWORD_FIELD, WRONG_PASSWORD_TEXT)
            click_on_element(SIGNIN_BUTTON)
            expect(page).to have_no_css(DASHBOARD_SELECTOR)
            clear_input(USERNAME_FIELD)            
        end

        def enter_incorrect_information
            enter_text(USERNAME_FIELD, WRONG_USERNAME_TEXT)
            enter_text(PASSWORD_FIELD, WRONG_PASSWORD_TEXT)
            click_on_element(SIGNIN_BUTTON)
            expect(get_element(ERROR_MESSAGE).text).not_to be_empty           
        end

        def enter_correct_details
            enter_text(USERNAME_FIELD, USERNAME)
            enter_text(PASSWORD_FIELD, PASSWORD)
            click_on_element(SIGNIN_BUTTON)
        end

        def check_dashboard
            page.should have_css(DASHBOARD_SELECTOR)
            page.should have_no_css(DASHBOARD_LOADER)
        end
    end
end

World(Oradian)
