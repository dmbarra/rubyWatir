require_relative 'spec_helper'

config = YAML.load_file("../config/config.yml")
data = YAML.load_file("../fixtures/data_tests.yml")


describe "Creating Users" do 
  it "Should be connected" do 
      @login.loginUser(config["user"] , config["pass"])
      if (@browser.title == data["titleExtraVerification"])
        @login.insertKey(config["question"])
      end
      expect(@browser.title).to eq(data["pageTitle"])
    end

 it "Should be register new User" do 
      @encrypter.navegateToUser
      @encrypter.addNewUser(data["email"] , data["office"])
      @encrypter.clickSaveUser
      expect(@encrypter.getMessage).to include(data["sucessMessageUser"])
    end

  it "Should be found new user" do
      @encrypter.navegateToUser
      @encrypter.inputSearch(data["email"])
      @encrypter.clickEmailUser(data["email"])
      expect(@encrypter.getInformationAboutUser).to include(data["email"])
    end

  it "Should be change the roles" do
      @encrypter.clickEditUser
      @encrypter.selectRoles "Admin"
      @encrypter.clickSaveUser
      expect(@encrypter.getMessage).to include(data["sucessUpdateMessageUser"])
    end

  it "Should be removed User" do
      @encrypter.clickRemoveUser
      expect(@encrypter.getMessage).to include(data["sucessRemoveMessageUser"])
    end
end 