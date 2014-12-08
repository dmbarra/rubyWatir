require 'watir'

class AuthenticationPage

	def initialize (browser)
		@browser = browser
		@userEdit = "user-signin"
		@passEdit = "pass-signin"
		@submitBtn = "signin-button"
		@questionEdit = "questionFactor.answer"
		@submitVerifyBtn = "verify_factor"
    @messageHome = 'message'
    end

    def inputUser (user)
    	@browser.text_field(:id, @userEdit).wait_until_present
      @browser.text_field(:id, @userEdit).clear
		  @browser.text_field(:id, @userEdit).set(user)
    end

    def inputPass(pass)
      @browser.text_field(:id, @passEdit).clear
	    @browser.text_field(:id, @passEdit).set(pass)
   	end

   	def clickSubmit()
		  @browser.button(:id, @submitBtn).click
   	end

   	def inputQuestionFactor(question)
		  @browser.text_field(:id, @questionEdit).wait_until_present
      @browser.text_field(:id, @questionEdit).clear
		  @browser.text_field(:id, @questionEdit).set(question)
   	end

   	def clickVerifySubmit()
   		@browser.button(:id, @submitVerifyBtn).click
      unless @browser.name.to_s.eql?('phantomjs')
        @browser.alert.ok 
      else
        @browser.article(:id, @messageHome).wait_until_present
      end
    end

   	def loginUser(user , pass)
      browserState()
   		inputUser(user)
   		inputPass(pass)
   		clickSubmit()
   	end

   	def insertKey(question)
      browserState()
      inputQuestionFactor(question)
      clickVerifySubmit()
      browserState()
   	end

    def browserState()
      @browser.ready_state
    end

end