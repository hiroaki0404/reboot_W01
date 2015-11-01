#!/usr/bin/env ruby
#
# W01 reboot script
#	W01 version: 11.411.13.80.824
#
require 'capybara'
require 'selenium-webdriver'

Capybara.register_driver :remote_firefox do |app|
  Capybara::Selenium::Driver.new(app, {browser: :remote})
end

Capybara.default_driver = :remote_firefox
Capybara.app_host = ENV['URL']

include Capybara::DSL

# login page
visit 'html/login.htm'

# English
exit unless page.has_content? 'COPYRIGHT'
select 'English', from: 'language_choice'

# login
exit unless page.has_content? 'COPYRIGHT'
fill_in 'user_type', with: ENV['ID']
fill_in 'input_password', with: ENV['PASSWORD']
find_by_id('login').click

# Connection page
exit unless page.has_content? 'IPv4'
find_by_id('fst_menu_settings').click

# Settings page
exit unless page.has_content? 'PIN'
click_link('System Settings')

# Reboot page
exit unless page.has_content? 'Device Screen Lock:'
find_by_id('trd_menu_reboot').click

# Reboot
exit unless page.has_content? 'Restart'
find_by_id('button_reboot').click

# Confirm Dialog
exit unless page.has_content? 'Confirm'
find_by_id('pop_confirm').click

# __END__
