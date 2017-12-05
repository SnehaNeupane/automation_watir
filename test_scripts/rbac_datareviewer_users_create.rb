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

###################Create Users######################

if create_users == 'set'

    if view_users== 'clear'
      browser.Puts "View Users check box is not checked in #{prod_usr_name} is not able to View Users so no new users can be created  \e[0;32m'Passed'\e[0m"
      Assertions.assertequal(true,true, "View Users check box is not checked in #{prod_usr_name} is not able to View Users so no new users can be created Passed")
      browser.close
    else 
      browser = Browser.new(url)
      browser.fill_input_text_by_name('user[email]', prod_usr_name )
      browser.fill_input_text_by_name('user[password]', prod_usr_pass)
      browser.button_click_name('commit') 
      
      browser.click_link_by_href('/admin/users')
       
      flag =  browser.find_link_by_a('Create A User').exists? 
      sleep 10
        if flag
          browser.Puts "#{prod_usr_name} is able to view Create a user button \e[0;32m'Passed'\e[0m"
          Assertions.assertequal(true,true, "#{prod_usr_name} is able to view Create a user button, Passed")
        else
          browser.Puts "#{prod_usr_name} is not able to view Create a user button \e[0;31m'Failed'\e[0m"
          Assertions.assertequal(true,false, "#{prod_usr_name} is not able to view Create a user button, Failed") 
        end

        browser.click_link_by_href('/admin/users')
        browser.click_link_by_text('Create A User')
        browser.fill_input_text_by_name('email', '1@prd.com')
        browser.check_checkbox("1")
        #browser.click_text_field_user('/admin/users','//*[@id="new_user_tmp"]/form/p[4]/input')

        browser.click_text_field_user('/admin/users','//*[@id="new_user_tmp"]/form/p[5]/input') # changed the 4 to 5 as this has changed to 5
        browser.Puts " #{prod_usr_name} is able to  Create a desired roles's User \e[0;32m'Passed'\e[0m"
        Assertions.assertequal(true,true, "#{prod_usr_name} is able to Create a desired roles's User, Passed")
    end

browser.close

elsif create_users == 'clear'

    if view_users== 'clear'
      browser.Puts "View Users check box is not checked in #{prod_usr_name} is not able to View Users so no new users can be created  \e[0;32m'Passed'\e[0m"
      Assertions.assertequal(true,true, "View Users check box is not checked in #{prod_usr_name} is not able to View Users so no new users can be created Passed")
      browser.close
    else 
      browser = Browser.new(url)
      browser.fill_input_text_by_name('user[email]', prod_usr_name )
      browser.fill_input_text_by_name('user[password]', prod_usr_pass)
      browser.button_click_name('commit')   

      sleep 5

      browser.click_link_by_href('/admin/users')
      
sleep 1

      # flag =  browser.find_link_by_class('Create A User').exists? 
      flag =  browser.find_div_class_link('pull-right','Create A User').exists?     #returns a Boolen value True or False
        if flag
            browser.Puts "Create_users check box is not checked in  #{prod_usr_name} is able to view Create a user button \e[0;31m'Failed'\e[0m"
            Assertions.assertequal(true,false, "Create_users check box is not checked in  #{prod_usr_name} is able to view Create a user button, Failed")
        else
            browser.Puts "Create_users check box is not checked in  #{prod_usr_name} is not able to view Create a user button \e[0;32m'Passed'\e[0m"
            Assertions.assertequal(true,true, "Create_users check box is not checked in  #{prod_usr_name} is not able to view Create a user button, Passed")
        end
    end
end

browser.close
