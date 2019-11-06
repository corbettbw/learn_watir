require 'rubygems'
require 'watir-webdriver'
browser = Watir::Browser.new
browser.goto 'http://puppies.herokuapp.com'

browser.button(:value => 'View Details', :index => 1).click
browser.button(:value => 'Adopt Me!').click
browser.button(:value => 'Complete the Adoption').click
browser.textarea(:id => "order_name").set "Zaphod Beeblebrox"
browser.textarea(:id => "order_address").set "123 W Granada, Phoenix, AZ 85003"
browser.textarea(:id => "order_email").set "zaphod@mailinator.com"
browser.select_list(:id => "order_pay_type").select "Check"
browser.button(:value => 'Place Order').click

fail 'Browser text did not match expected value' unless browser.text.include? 'Thank you for adopting a puppy!'

# sleep 5
# browser.close
