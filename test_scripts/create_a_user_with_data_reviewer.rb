# Description   : Creating a user with the Role of Data Reviewer
# Pre-requisites:  
# Date: February 24 2014
#########################################

require '../lib/browser'
require '../Utilities/util'

env_setting = Util.data_from_rbac['create_a_user_with_data_reviewer']
url = env_setting['url_admin']
username_admin = env_setting['username_admin']
password_admin = env_setting['password_admin']
username = env_setting['username_cf']
prod_usr_name = env_setting['prod_usr_name']

browser = Browser.new(url)
browser.fill_input_text_by_name('user[email]', username_admin )
browser.fill_input_text_by_name('user[password]', password_admin)
browser.button_click_name('commit')
browser.wait_till_load(10)

browser.click_link_by_href('/admin/users')
browser.click_link_by_text('Create A User')
browser.fill_input_text_by_name('email', prod_usr_name)
browser.check_checkbox("23")
browser.click_text_field_user('/admin/users','//*[@id="new_user_tmp"]/form/p[4]/input')
						
browser.close