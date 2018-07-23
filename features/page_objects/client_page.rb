module Oradian

    class ClientPage < BasePage

        CLIENT_PAGE = '.ClientStatusIndicator__Indicator--1vTdO'

        def check_client_page
            page.should have_css(CLIENT_PAGE)
        end       
    end
end

World(Oradian)