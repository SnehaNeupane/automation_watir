# Description   : Verifying Production Managers can add accounts 
# Pre-requisites:  
# Date: February 24 2014
#########################################
Dir[File.join(File.expand_path('../../', __FILE__),'Data/*.rb')].each {|file| require (file)}

env_setting = Util.data_from_datafile['user_assign_role']
url = env_setting['url_admin']
username_admin = env_setting['username_admin']
password_admin = env_setting['password_admin']
username = env_setting['username_cf']
browser = Browser.new(url)
browser.fill_input_text_by_name('user[email]', username_admin )
browser.fill_input_text_by_name('user[password]', password_admin)
browser.button_click_name('commit')

browser.click_link_by_href('/admin/accounts')
browser.click_link_by_href('#account_temp')
browser.fill_input_text_by_name('account[name]', 'prd')
browser.click_text_field('/admin/accounts', '//*[@id="new_account"]/div[3]/input')

browser.click_link_by_href('/admin/accounts/17')
browser.click_link_by_href('#lines_temp')
browser.click_span_class('filter-option pull-left')
browser.fill_input_text_by_class('input-block-level form-control', 'QA_Automation')
browser.click_by_a('QA_Automation')
browser.click_link_by_text('Submit')
browser.close

