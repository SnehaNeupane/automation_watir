require 'rubygems'
require '../lib/browser'
require '../Utilities/util'
require 'pry'

# #########################Fetching Data########################

env_setting1= Util.read_data_from_file('DataforRbac')
env_setting= env_setting1['assigning_and_retracting_roles_by_finance']

url = env_setting['url_admin']

username_admin = env_setting['username_admin']
password_admin = env_setting['password_admin']
manage_roles_and_permissions = env_setting['manage_roles_and_permissions'] 
prod_usr_name = env_setting['prod_usr_name']
prod_usr_pass = env_setting['prod_usr_pass']  
usr = env_setting['usr']

browser = Browser.new(url)
browser.fill_input_text_by_name('user[email]', username_admin )
browser.fill_input_text_by_name('user[password]', password_admin)
browser.button_click_name('commit')
browser.click_link_by_href('/admin/roles')

browser.checkbox_action(4,'71',manage_roles_and_permissions)

browser.click_text_field_user('/admin/roles/edit_permissions','/html/body/div[3]/aside[2]/section[2]/section/div/div/form/div[2]/div/input')

 browser.click_link_by_text('admin@cloudfactory.com')
 browser.click_link_by_text('Logout')

browser.close

#################Roles and Permissions########################

if manage_roles_and_permissions == 'set'
  browser = Browser.new(url)
  browser.fill_input_text_by_name('user[email]', prod_usr_name )
  browser.fill_input_text_by_name('user[password]', prod_usr_pass)
  browser.button_click_name('commit') 

  sleep 5

    flag = browser.find_link_by_href('/admin/roles').exists?

    if flag
      browser.Puts "Manage Roles check box is checked in and Roles is displayed for #{prod_usr_name}, \e[0;32m'Passed'\e[0m"
      Assertions.assertequal(true,true, "Manage Roles check box is checked in and Roles is displayed for #{prod_usr_name}, Passed")
    else
      browser.Puts "Manage Roles check box is checked in and Roles is not displayed #{prod_usr_name}, \e[0;31m'Failed'\e[0m"
      Assertions.assertequal(true,false,"Manage Roles check box is checked in and Roles is not displayed #{prod_usr_name}, Failed")
    end
    
end
browser.close

if manage_roles_and_permissions == 'clear'
  browser = Browser.new(url)
    browser.Puts browser.get_browser_title
  browser.fill_input_text_by_name('user[email]', prod_usr_name )
  browser.fill_input_text_by_name('user[password]', prod_usr_pass)
  browser.button_click_name('commit') 

  sleep 5

    flag = browser.find_link_by_href('/admin/roles').exists?

    if flag
      browser.Puts "Manage Roles check box is not checked in and Roles is displayed #{prod_usr_name}, \e[0;31m'Failed'\e[0m"
      Assertions.assertequal(true,false,"Manage Roles check box is not checked in and Roles is displayed #{prod_usr_name}, Failed")
    else
      browser.Puts "Manage Roles check box is not checked in and Roles is not displayed for #{prod_usr_name}, \e[0;32m'Passed'\e[0m"
      Assertions.assertequal(true,true, "Manage Roles check box is not checked in and Roles is not displayed for #{prod_usr_name}, Passed")
    end
end
browser.close
