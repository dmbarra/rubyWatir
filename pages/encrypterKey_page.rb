require 'watir'

class EncrypterPageKey

	def initialize (browser)
		@browser = browser
		#-----
		@menu = "menu"
		@menuProfile= "menu-profile"
		@addNewKeyBtn= "btn-add-key"
		@alertSpan= "alert"
		@removeRegisterKey = "btn-remove-key"
		@firstRegister = "collapse"
		#----
		@deviceNameEdit= "key_device_name"
		@deviceSerialNumber= "key_serial_number"
		@deviceKey= "key_encrypted_blob"
		@saveKeyBtn= "btn-save-key"
		#---
		@alertSpan= "alert"
    end

    def navegateToProfile()
    	@browser.a(:id, @menu).wait_until_present
    	@browser.a(:id, @menu).click
    	@browser.span(:id, @menuProfile).click
        @browser.a(:id, @addNewKeyBtn).wait_until_present
    end

    def inputDeviceName (deviceName)
    	@browser.text_field(:id, @deviceNameEdit).wait_until_present
        @browser.text_field(:id, @deviceNameEdit).clear
		@browser.text_field(:id, @deviceNameEdit).set(deviceName)
    end

    def inputSerialNumber (serialNumber)
        @browser.text_field(:id, @deviceSerialNumber).clear
		@browser.text_field(:id, @deviceSerialNumber).set(serialNumber)
    end

    def inputDeviceKey (deviceKey)
        @browser.text_field(:id, @deviceKey).clear
		@browser.text_field(:id, @deviceKey).set(deviceKey)
    end

    def clickSaveKey()
    	@browser.button(:id, @saveKeyBtn).wait_until_present
    	@browser.button(:id, @saveKeyBtn).click
    end

    def clickNewKey()
    	@browser.a(:id, @addNewKeyBtn).click
    end

     def clickRemoveKey()
    	@browser.button(:id, @removeRegisterKey).wait_until_present
        unless @browser.name.to_s.eql?('phantomjs')
            @browser.button(:id, @removeRegisterKey).click
            @browser.alert.ok 
        else
            @browser.execute_script("document.getElementById('#{@removeRegisterKey}').onclick = function() {return true;}")
            @browser.button(:id, @removeRegisterKey).click
        end
    end

    def clickFirstRegister()
        @browser.a(:id, @firstRegister).wait_until_present
    	@browser.a(:id, @firstRegister).click
    end

    def getMessage()
    	@browser.span(:id, @alertSpan).wait_until_present
    	return @browser.span(:id, @alertSpan).text
    end

	def addNewKey(deviceName , serialNumber , deviceKey)
		clickNewKey()
		inputDeviceName(deviceName)
		inputSerialNumber(serialNumber)
		inputDeviceKey(deviceKey)
		clickSaveKey()
	end

end