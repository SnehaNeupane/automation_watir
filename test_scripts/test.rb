require 'rubygems'
require '../lib/browser'
require '../Utilities/util'
require 'pry'

browser = Browser.new("http://www.cloudfactory.di/templates/nzsvZJFRHN/edit")

browser.fill_input_text_by_name('developer_session[email]', 'sushil.jakibanja@gmail.com' )
browser.fill_input_text_by_name('developer_session[password]', '44FFffLN')
browser.button_click_name('commit')
browser.click_link_by_text('Edit Job Template')
browser.click_link_by_href('#custom_html')
binding.pry
browser.select_file_name("file","/Users/cloudfactory/Downloads/Census_Content_Review-1.html")
