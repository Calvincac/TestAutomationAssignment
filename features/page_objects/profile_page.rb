module Oradian

    class ProfilePage < BasePage
        USER_NAME       = 'Calvin Ávila Custódio'

        def check_user_name
            expect(page).to have_content(USER_NAME)
        end       
    end
end

World(Oradian)