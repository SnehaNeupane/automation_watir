require 'rubygems'
require '../lib/browser'
require '../Utilities/util'
require '../lib/assertions'
require 'pry'

# #########################Fetching Data########################

env_setting1= Util.read_data_from_file('DataforRbac')
env_setting= env_setting1['assigning_and_retracting_roles_by_data_reviewer']

url = env_setting['url_admin']

username_admin = env_setting['username_admin']
password_admin = env_setting['password_admin']
view_users = env_setting['view_users'] 
create_users = env_setting['create_users']
edit_users = env_setting['edit_users']
delete_users = env_setting['delete_users'] 
prod_usr_name = env_setting['prod_usr_name']
prod_usr_pass = env_setting['prod_usr_pass']  
usr = env_setting['usr']

browser = Browser.new(url)
browser.fill_input_text_by_name('user[email]', username_admin )
browser.fill_input_text_by_name('user[password]', password_admin)
browser.button_click_name('commit')
browser.click_link_by_href('/admin/roles')

browser.checkbox_action(1,'56',view_users)
browser.checkbox_action(1,'57',create_users)
browser.checkbox_action(1,'58',edit_users)
browser.checkbox_action(1,'59',delete_users)

browser.click_text_field_user('/admin/roles/edit_permissions','/html/body/div[3]/aside[2]/section[2]/section/div/div/form/div[2]/div/input')

 browser.click_link_by_text('admin@cloudfactory.com')
 browser.click_link_by_text('Logout')

browser.close

#########################View Users #############################
if view_users == 'set'
    browser = Browser.new(url)
    browser.fill_input_text_by_name('user[email]', prod_usr_name )
    browser.fill_input_text_by_name('user[password]', prod_usr_pass)
    browser.button_click_name('commit')

    sleep 10

    flag = browser.find_link_by_href('/admin/users').exists? # checks presence of User Text/Link

    if flag
      browser.Puts "User link is displayed on the side bar when the check box is set for  #{prod_usr_name}, \e[0;32m'Passed'\e[0m"
      Assertions.assertequal(true,true, "User link is displayed on the side bar when the check box is set for  #{prod_usr_name}, Passed")
    else
      browser.Puts "User link is not displayed on the side bar when the check is set for  #{prod_usr_name}, \e[0;31m'Failed'\e[0m"
      Assertions.assertequal(true,false,"User link is not displayed on the side bar when the check is set for  #{prod_usr_name}, Failed'")
    end 

    browser.click_link_by_text('Users')
    if browser.get_browser_title == "Users | CloudFactory"
      browser.Puts " #{prod_usr_name} User check box is checked, #{prod_usr_name} is able to view user profile \e[0;32m'Passed'\e[0m"
      Assertions.assertequal(true,true, "User check box is checked, #{prod_usr_name} is able to view user profile, Passed")
    else 
      browser.Puts " #{prod_usr_name} User check box is checked, #{prod_usr_name} is not able to view user profile  \e[0;31m'Failed \e[0m"
      Assertions.assertequal(true,false, "User check box is checked, #{prod_usr_name} is not able to view user profile, Failed")
    end
    browser.close

elsif view_users== 'clear'

    browser = Browser.new(url)
    browser.fill_input_text_by_name('user[email]', prod_usr_name )
    browser.fill_input_text_by_name('user[password]', prod_usr_pass)
    browser.button_click_name('commit')# logs in with user id and password 

    sleep 5

     # flag =  browser.find_link_by_a('Users').exists? 
     # flag = browser.find_link_('/admin/users').exists? 
  
     flag =  browser.find_link_by_href('Users').exists?
    
    if flag
      browser.Puts "View_user check box is not checked in and User #{prod_usr_name} is able to view Users link/button  \e[0;31m'Failed'\e[0m"
      Assertions.assertequal(true,false, "View_user check box is not checked in and User #{prod_usr_name} is able to view Users link/button, Failed")  
    else  
      browser.Puts " View_user check box is not checked in and User #{prod_usr_name} is not able to view Users link/button  \e[0;32m'Passed'\e[0m"
      Assertions.assertequal(true,true, "View_user check box is not checked in and User #{prod_usr_name} is not able to view Users link/button, Passed")
    end
end

browser.close