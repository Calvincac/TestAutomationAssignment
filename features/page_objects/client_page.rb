module Oradian

    class ClientPage < BasePage

        CLIENT_PAGE = '.ClientStatusIndicator__Indicator--1vTdO'

        def check_client_page
            page.should have_css(CLIENT_PAGE)
        end
        
        def check_client_name(client_name)
            page.should have_content(client_name)
        end
    end
end

World(Oradian)