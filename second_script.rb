require 'rubygems'
require 'watir-webdriver'
require_relative 'Adoption_Helper'

include AdoptionHelper

visit_puppy_adoption_page()
adopt_puppy_number(1)
continue_adopting_puppies()
adopt_puppy_number(2)
checkout_with('Zaphod', '123 Main Street', 'zaphod@hhgttg.com', 'Check')
verify_page_contains('Thank you for adopting a puppy!')
close_the_browser()
