require 'watir-webdriver'

Before do |scenario|
  DataMagic.load_for_scenario(scenario)
  @browser = Watir::Browser.new :firefox
end


After do
  @browser.close
end
