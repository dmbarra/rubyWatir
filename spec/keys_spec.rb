require_relative 'spec_helper'

config = YAML.load_file("../config/config.yml")
data = YAML.load_file("../fixtures/data_tests.yml")

describe "Creating Keys" do 
  it "Should be connected" do 
    @login.loginUser(config["user"] , config["pass"])
    if (@browser.title == data["titleExtraVerification"])
      @login.insertKey(config["question"])
    end
    expect(@browser.title).to eq(data["pageTitle"])
  end

 it "Should be register new key" do 
    @encrypterKey.navegateToProfile()
    @encrypterKey.addNewKey(data["deviceName"] , data["serialNumber"] , data["deviceKey"])
    expect(@encrypterKey.getMessage()).to include(data["sucessMessageKey"])
  end

  it "Should be removed register" do
    @encrypterKey.clickFirstRegister()
    @encrypterKey.clickRemoveKey()
    expect(@encrypterKey.getMessage()).to include(data["sucessRemoveMessageKey"])
  end

end