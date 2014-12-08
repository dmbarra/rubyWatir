require 'watir'

class EncrypterPageUser

	def initialize (browser)
		@browser = browser
		#-----
		@menu = "menu"
		@menuUser= "menu-users"
		@addNewUserBtn= "btn-add-user"
		#-----
		@userEmailEdit= "user_email"
		@userOfficeSelect = "user_office_id"
		@saveUserBtn= "btn-save-user"
		#---
		@userInformation ="user-details-email"
		@userSearchEdit = "search-user"
		@removeRegisterUser = "btn-remove-user"
		@removeEditUser = "btn-edit-user"
		#---
		@userRolesCheckboxAdmin = "admin"
		@userRolesCheckboxTechOps = "techops"
		#---
		@alertSpan= "alert"
    end

    def navegateToUser
    	@browser.a(:id, @menu).wait_until_present
    	@browser.a(:id, @menu).click
    	@browser.span(:id, @menuUser).click
        @browser.a(:id, @addNewUserBtn).wait_until_present
    end

     def inputEmail (email)
    	@browser.text_field(:id, @userEmailEdit).wait_until_present
        @browser.text_field(:id, @userEmailEdit).clear
		@browser.text_field(:id, @userEmailEdit).set(email)
    end

     def selectOffice (office)
    	@browser.select_list(:id, @userOfficeSelect).wait_until_present
        @browser.select_list(:id, @userOfficeSelect).select(office)
    end

    def selectRoles (roles)
    	if roles=="Admin"
    		@browser.input(:id, @userRolesCheckboxAdmin).wait_until_present
        	@browser.input(:id, @userRolesCheckboxAdmin).click
    	end
    	if roles=="Techops"
			@browser.input(:id, @userRolesCheckboxTechOps).wait_until_present
        	@browser.input(:id, @userRolesCheckboxTechOps).click
    	end
    end

    def clickSaveUser
    	@browser.button(:id, @saveUserBtn).wait_until_present
    	@browser.button(:id, @saveUserBtn).click
    end

    def clickNewUser
    	@browser.a(:id, @addNewUserBtn).wait_until_present
    	@browser.a(:id, @addNewUserBtn).click
    end

    def addNewUser(email , office)
		clickNewUser()
		inputEmail(email)
		selectOffice(office)
	end

	def getMessage
    	@browser.span(:id, @alertSpan).wait_until_present
    	return @browser.span(:id, @alertSpan).text
    end

    def inputSearch (search)
    	@browser.text_field(:id, @userSearchEdit).wait_until_present
        @browser.text_field(:id, @userSearchEdit).clear
		@browser.text_field(:id, @userSearchEdit).set(search)
		@browser.send_keys :enter
    end

 	def clickEmailUser (email)
    	@browser.a(:id, email).wait_until_present
		@browser.a(:id, email).click
    end

    def clickEditUser
    	@browser.a(:id, @removeEditUser).wait_until_present
		@browser.a(:id, @removeEditUser).click
    end

    def clickRemoveUser
    	@browser.button(:id, @removeRegisterUser).wait_until_present
        unless @browser.name.to_s.eql?('phantomjs')
            @browser.button(:id, @removeRegisterUser).click
            @browser.alert.ok 
        else
            @browser.execute_script("document.getElementById('#{@removeRegisterUser}').onclick = function() {return true;}")
            @browser.button(:id, @removeRegisterUser).click
        end
    end

    def getInformationAboutUser
    	@browser.li(:id, @userInformation).wait_until_present
    	return @browser.li(:id, @userInformation).text
    end

end