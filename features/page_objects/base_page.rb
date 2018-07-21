

module Oradian

    class BasePage
        
        include RSpec::Matchers
        include Capybara::DSL

        def close_window
            page.driver.browser.close
        end
        
        def click_on_element(element_selector)
            find(element_selector).click
        end

        def enter_text(element_selector, text)
            find(element_selector).set(text)
        end

        def get_element(element_selector)
            find(element_selector)
        end

        def get_elements(element_selector)
            all(element_selector)
        end

        def clear_input(element_selector)
            find(element_selector).set('')
        end

        def go_back
            page.go_back
        end
    end
end

World(Oradian)
