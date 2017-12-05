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

######################Edit Users######################################

if edit_users == 'set'

    if view_users== 'clear'
      browser.Puts "View Users check box is not checked in #{prod_usr_name} is not able to View Users so existing users can't be edited  \e[0;32m'Passed'\e[0m"
      Assertions.assertequal(true,true, "View Users check box is not checked in #{prod_usr_name} is not able to View Users so existing users can't be edited  Passed")
    else 
      browser = Browser.new(url)
      browser.fill_input_text_by_name('user[email]', prod_usr_name )
      browser.fill_input_text_by_name('user[password]', prod_usr_pass)
      browser.button_click_name('commit') 

      sleep 5

      browser.click_link_by_href('/admin/users')
      browser.fill_input_text_by_class('span2',usr) # enters desire user id in the text box
      browser.press_enter

      sleep 5

      browser.click_link_by_text(usr) # clicks on the searched output entereed in the text box
    end

    browser.click_text_field_user('/admin/users/5/add_roles','/html/body/section/div[2]/div/div[1]/form/div[2]/input') 
    browser.Puts " #{prod_usr_name} is able to  edit desired roles's User  \e[0;32m'Passed'\e[0m"
    Assertions.assertequal(true,true, "#{prod_usr_name} is able to  edit desired roles's User , Passed")
browser.close

elsif edit_users== 'clear'

  if view_users== 'clear'
      browser.Puts "View Users check box is not checked in #{prod_usr_name} is not able to View Users so existing users can't be edited  \e[0;32m'Passed'\e[0m"
      Assertions.assertequal(true,true, "View Users check box is not checked in #{prod_usr_name} is not able to View Users so existing users can't be edited  Passed")
      browser.close
      
  else 
      browser = Browser.new(url)
      browser.fill_input_text_by_name('user[email]', prod_usr_name )
      browser.fill_input_text_by_name('user[password]', prod_usr_pass)
      browser.button_click_name('commit') 
      browser.click_link_by_href('/admin/users')
      browser.fill_input_text_by_class('span2',usr) # enters desire user id in the text box
      browser.press_enter
    
      sleep 5
      browser.find_link_by_text(usr)

      flag =  browser.find_link_by_text(usr).exists?
      
      if flag
        browser.Puts "Edit users check box is  not checked  and user #{prod_usr_name} is  able to click on #{usr} Failed"
        Assertions.assertequal(true,false, "Edit users check box is  not checked  and user #{prod_usr_name} is able to click on #{usr} \e[0;31m'Failed'\e[0m")
      else
       browser.Puts "Edit users check box is  not checked  and user #{prod_usr_name} is not able to click on #{usr} \e[0;32m'Passed'\e[0m"
       Assertions.assertequal(true,true, "Edit users check box is  not checked  and user #{prod_usr_name} is not able to click on #{usr} Passed")
      end
  end
end

browser.close
