require 'rubygems'
require 'watir-webdriver'

def visit_puppy_adoption_page
  @browser = Watir::Browser.new :firefox
  @browser.goto 'http://puppies.herokuapp.com'
end

def adopt_puppy_number(num)
  @browser.button(:value => 'View Details', :index => num - 1).click
  @browser.button(:value => 'Adopt Me!').click
end

def continue_adopting_puppies
  @browser.button(:value => 'Adopt Another Puppy').click
end

def checkout_with(name, address, email, pay_type)
  @browser.button(:value => 'Complete the Adoption').click
  @browser.textarea(:id => "order_name").set(name)
  @browser.textarea(:id => "order_address").set(address)
  @browser.textarea(:id => "order_email").set(email)
  @browser.select_list(:id => "order_pay_type").select(pay_type)
  @browser.button(:value => 'Place Order').click
end

def verify_page_contains(text)
  fail unless @browser.text.include? (text)
end

def close_the_browser
  @browser.close
end

visit_puppy_adoption_page()
adopt_puppy_number(1)
continue_adopting_puppies()
adopt_puppy_number(2)
checkout_with('Zaphod', '123 Main Street', 'zaphod@hhgttg.com', 'Check')
verify_page_contains('Thank you for adopting a puppy!')
close_the_browser()
