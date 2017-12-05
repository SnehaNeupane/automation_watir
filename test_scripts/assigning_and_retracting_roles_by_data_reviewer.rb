# Description   : Setting on/off the check box to manage the roles and verifying with 
# Pre-info:   for now view user's profile, list all users shall not be worked , requirement not line  or else the script will not handle the error . 
						#http://cloudfactory.qa/admin/lines/249/transactions This page should have 	 	idclear 
						# worker with the name/id 123456 should be available.
						# Production line data should have a known data like  "for QA automation "  to be set in the data file 
						# User to be used as production mgr is 2@prd.com password is tech@cloudfactory.com
						#Use skill 
						# Use worker_id as 
						#use production line as
						# use production lines as
						# A new skill needs to be added or else it throws an  error , make sure you  have a skill  which is not with the user . in which you are gonna add . 
						#in reports http://cloudfactory.qa/admin/reports page , choose account which has a  463 , or else need to chaange the script . line no approx :546	
						#please change line :555 the link portion as per the data available.
# Date: February 25 2018
# 
##########################################################################

require '../lib/browser'
require '../Utilities/util'

#########################Fetching Data########################

env_setting1= Util.read_data_from_file('DataforRbac')
env_setting= env_setting1['assigning_and_retracting_roles_by_data_reviewer']
url = env_setting['url_admin']
prod_usr_name = env_setting['prod_usr_name']
prod_usr_pass = env_setting['prod_usr_pass']	
prodskill = env_setting['prodskill']
add_skill = env_setting['add_skill']
init_gs = env_setting['init_gs']
algorithm = env_setting['algorithm']
production_line = env_setting['production_line']
worker_id = env_setting['worker_id']
production_lines = env_setting['production_lines']
transaction_id = env_setting['transaction_id']
developer_id = env_setting['developer_id']
station_id = env_setting['station_id']
production_lines_id = env_setting['production_lines_id']
production_lines_id_not_exist = env_setting['production_lines_id_not_exist']
reward = env_setting['reward']
username_admin = env_setting['username_admin']
password_admin = env_setting['password_admin']
account_name = env_setting['account_name']
usr = env_setting['usr']
account_exist = env_setting['account_exist']
account_not_exist = env_setting['account_not_exist']
view_users = env_setting['view_users'] 
create_users = env_setting['create_users']
edit_users = env_setting['edit_users']
delete_users = env_setting['delete_users'] 
view_accounts_all = env_setting['view_accounts_all']
view_accounts_assigned = env_setting['view_accounts_assigned']
create_accounts = env_setting['create_accounts']
edit_accounts_all = env_setting['edit_accounts_all'] 
edit_accounts_assigned = env_setting['edit_accounts_assigned']
delete_accounts_all = env_setting['delete_accounts_all']
delete_accounts_assigned = env_setting['delete_accounts_assigned'] 
associate_users_all = env_setting['associate_users_all']
associate_users_assigned = env_setting['associate_users_assigned']
manage_roles_and_permissions = env_setting['manage_roles_and_permissions'] 
view_workers = env_setting['view_workers']
edit_workers = env_setting['edit_workers']
assign_edit_worker_skills = env_setting['assign_edit_worker_skills']
view_skills = env_setting['view_skills'] 
create_new_skills = env_setting['create_new_skills']
edit_skills = env_setting['edit_skills']
upload_workers_or_modify_skills_in_mass = env_setting['upload_workers_or_modify_skills_in_mass']
access_non_assigned = env_setting['access_non_assigned']
view_lines = env_setting['view_lines'] 
create_lines = env_setting['create_lines']
edit_settings = env_setting['edit_settings']
delete_lines = env_setting['delete_lines'] 
view_overview = env_setting['view_overview']
view_gold_standards = env_setting['view_gold_standards']
create_gold_standards = env_setting['create_gold_standards']
view_production_runs = env_setting['view_production_runs'] 
delete_production_runs = env_setting['delete_production_runs']
create_production_runs = env_setting['create_production_runs']
view_production_run_details = env_setting['view_production_run_details']
view_production_run_results = env_setting['view_production_run_results'] 
view_reports_all = env_setting['view_reports_all']
view_reports_assigned = env_setting['view_reports_assigned']
browser = Browser.new(url)
browser.fill_input_text_by_name('user[email]', username_admin )
browser.fill_input_text_by_name('user[password]', password_admin)
browser.button_click_name('commit')
browser.click_link_by_href('/admin/roles')
#### selecting and de-selecting checkbox
browser.checkbox_action(1,'56',view_users)
browser.checkbox_action(1,'57',create_users)# Needs more detailed information regarding this . will sscript later . 
browser.checkbox_action(1,'58',edit_users)# Needs more detail3d infomation regarding this . will script later . 
browser.checkbox_action(1,'59',delete_users)
browser.checkbox_action(1,'61',view_accounts_all)
browser.checkbox_action(1,'62',view_accounts_assigned)
browser.checkbox_action(1,'63',create_accounts)
browser.checkbox_action(1,'64',edit_accounts_all)
browser.checkbox_action(1,'65',edit_accounts_assigned)
browser.checkbox_action(1,'66',delete_accounts_all)
browser.checkbox_action(1,'67',delete_accounts_assigned)
browser.checkbox_action(1,'68',associate_users_all)
browser.checkbox_action(1,'69',associate_users_assigned)
browser.checkbox_action(1,'71',manage_roles_and_permissions)
browser.checkbox_action(1,'73',view_workers)
browser.checkbox_action(1,'74',edit_workers)
browser.checkbox_action(1,'75',assign_edit_worker_skills)
browser.checkbox_action(1,'77',view_skills)
browser.checkbox_action(1,'78',create_new_skills)
browser.checkbox_action(1,'79',edit_skills)
browser.checkbox_action(1,'80',upload_workers_or_modify_skills_in_mass)
browser.checkbox_action(1,'82',access_non_assigned)
browser.checkbox_action(1,'83',view_lines)
browser.checkbox_action(1,'84',create_lines)
browser.checkbox_action(1,'85',edit_settings)
browser.checkbox_action(1,'86',delete_lines)
browser.checkbox_action(1,'87',view_overview)
browser.checkbox_action(1,'88',view_gold_standards)
browser.checkbox_action(1,'89',create_gold_standards)
browser.checkbox_action(1,'90',view_production_runs)
browser.checkbox_action(1,'91',create_production_runs)
browser.checkbox_action(1,'92',delete_production_runs)
browser.checkbox_action(1,'93',view_production_run_details)
browser.checkbox_action(1,'94',view_production_run_results)
browser.checkbox_action(1,'96',view_reports_all)
browser.checkbox_action(1,'97',view_reports_assigned)


browser.click_text_field_user('/admin/roles/edit_permissions','/html/body/div[3]/aside[2]/section[2]/section/div/div/form/div[2]/div/input')

 browser.click_link_by_text('admin@cloudfactory.com')
 browser.click_link_by_text('Logout')

browser.close

######################checks the permission View users 
if view_users == 'set'
		browser = Browser.new(url)
		browser.fill_input_text_by_name('user[email]', prod_usr_name )
		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
		browser.button_click_name('commit')
		flag = browser.find_link_by_href('/admin/users').exists? # checks presence of User Text/Link
		if flag
			browser.Puts "User link is displayed on the side bar when the check box for manage user is checked in, Passed"
			Assertions.assertequal(true,true,"User link is displayed on the side bar when the check box for manage user is checked in, Passed")
		else
			browser.Puts "User link is not displayed on the side bar when the check box for manage user is checked in , Failed"
						Assertions.assertequal(true,failed,"User link is not displayed on the side bar when the check box for manage user is checked in , Failed")
		end
		if browser.get_browser_title == "Users | CloudFactory"
			browser.Puts "Manage user check box is checked , Production manager cannot view user profile Passed /Failed need clarification"
						Assertions.assertequal(true,true,"Manage user check box is checked , Production manager cannot view user profile Passed ")
		else 
			browser.Puts "Manage user check box is check, production manager is not able to view user profile Passed /Failed need clarification"
						Assertions.assertequal(true,false,"Manage user check box is check, production manager is not able to view user profile Failed ")
		end
		browser.close
elsif view_users== 'clear'

		browser = Browser.new(url)
		browser.fill_input_text_by_name('user[email]', prod_usr_name )
		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
		browser.button_click_name('commit')# logs in with user id and password 
		flag = browser.find_link_by_href('/admin/users').exists? 
		if flag 
			browser.Puts " view_user check box is not checked in   and User #{prod_usr_name} is able to view Users link/button  '\e[0;31m'Failed'\e[0m'"
						Assertions.assertequal(true,true," view_user check box is not checked in   and User #{prod_usr_name} is not able to view Users link/button  '\e[0;31m'Passed'\e[0m'")

		else 
			browser.Puts "view_user check box is not checked in   and User #{prod_usr_name} is not able to view Users link/button  Passed"
						Assertions.assertequal(true,false,"view_user check box is not checked in   and User #{prod_usr_name} is  able to view Users link/button  Failed")

		end
end

	browser.close
if create_users == 'set'
		if view_users== 'clear'
			browser.Puts "Since View User checkbox is not checked in so  #{prod_usr_name} is not able to create users "
			browser.close
		else 

			browser = Browser.new(url)
			browser.fill_input_text_by_name('user[email]', prod_usr_name )
			browser.fill_input_text_by_name('user[password]', prod_usr_pass)
			browser.button_click_name('commit')		


			flag = 	browser.find_link_by_href('/admin/workers/new').exists? 	
				if flag
					browser.Puts "#{prod_usr_name} is able to view Create a user button Passed"
										Assertions.assertequal(true,true,"#{prod_usr_name} is able to view Create a user button Passed")

				else
					browser.Puts "#{prod_usr_name} is not able to view Create a user button Failed"
										Assertions.assertequal(true,false,"#{prod_usr_name} is not able to view Create a user button Failed")

				end

				browser.click_link_by_href('/admin/users')
				browser.click_link_by_href('/admin/workers/new')
				browser.fill_input_text_by_name('email', '1@prd.com')
				browser.check_checkbox("1")
				browser.click_text_field_user('/admin/users','//*[@id="new_user_tmp"]/form/p[4]/input')
				browser.Puts " #{prod_usr_name} is able to  Create a desired roles's User Passed"
				Assertions.assertequal(true,true," #{prod_usr_name} is able to  Create a desired roles's User Passed")
		end

browser.close


elsif create_users == 'clear'
		if view_users== 'clear'
			browser.Puts "Since View User checkbox is not checked in so  #{prod_usr_name} is not able to create users "
			browser.close
		else 
			browser = Browser.new(url)
			browser.fill_input_text_by_name('user[email]', prod_usr_name )
			browser.fill_input_text_by_name('user[password]', prod_usr_pass)
			browser.button_click_name('commit')		
			flag = 	browser.find_link_by_text('Create A User').exists? 	#returns a Boolen value True or False
				if flag
						browser.Puts "create_users check box is not checked in  #{prod_usr_name} is able to view Create a user button Failed"
					Assertions.assertequal(true,false,"create_users check box is not checked in  #{prod_usr_name} is able to view Create a user button Failed")

				else
						browser.Puts "create_users check box is not checked in  #{prod_usr_name} is not able to view Create a user button Passed"
					Assertions.assertequal(true,true,"create_users check box is not checked in  #{prod_usr_name} is not able to view Create a user button Passed")
				end
		end
end
browser.close

# if edit_users == 'set'

# 		if view_users== 'clear'
# 			browser.Puts "Since View User checkbox is not checked in so  #{prod_usr_name} is not able to edit users "
# 			browser.close
# 		else 
# 			browser = Browser.new(url)
# 			browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 			browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 			browser.button_click_name('commit')	
# 			browser.click_link_by_href('/admin/users')
# 			browser.fill_input_text_by_class('span2',usr) # enters desire user id in the text box
# 			browser.press_enter
# 			browser.click_link_by_text(usr) # clicks on the searched output entereed in the text box
# 		end
		
# # clears all the  checkbox 
# 		browser.checkbox_action(0,'1','clear')
# 		browser.checkbox_action(0,'2','clear')
# 		browser.checkbox_action(0,'3','clear')
# 		browser.checkbox_action(0,'4','clear')
# 		browser.checkbox_action(0,'2','set')
# 		browser.click_text_field_user('/admin/users/5/add_roles','/html/body/section/div[2]/div/div[1]/form/div[2]/input') # clicks on 
# 		browser.Puts " #{prod_usr_name} is able to  edit desired roles's User Passed"
# 	Assertions.assertequal(true,true," #{prod_usr_name} is able to  edit desired roles's User Passed")


# browser.close
# elsif edit_users== 'clear'

# 	if view_users== 'clear'
# 			browser.Puts "Since View User checkbox is not checked in so  #{prod_usr_name} is not able to edit users "
# 			browser.close
# 	else 
# 			browser = Browser.new(url)
# 			browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 			browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 			browser.button_click_name('commit')	
# 			browser.click_link_by_href('/admin/users')
# 			browser.fill_input_text_by_class('span2',usr) # enters desire user id in the text box
# 			browser.press_enter
# 			browser.click_link_by_text(usr)

# 			flag = browser.find_div_class('gritter-item-wrapper gritter-alert').exists?
# 			if flag
# 				browser.Puts " edit_users check box is  not checked  and user #{prod_usr_name} is not able to click on #{usr} Passed"
# 			Assertions.assertequal(true,true," edit_users check box is  not checked  and user #{prod_usr_name} is not able to click on #{usr} Passed")

# 			else
				
# 				browser.Puts "edit_users check box is  not checked  and user #{prod_usr_name} is  able to click on #{usr} Failed"
# 				Assertions.assertequal(true,true,"edit_users check box is  not checked  and user #{prod_usr_name} is  able to click on #{usr} Failed")

# 			end
# 	end
# end

#   browser.close

# #Manage Roles and Permissions

# if manage_roles_and_permissions == 'set'
# 	browser = Browser.new(url)
# 	browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 	browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 	browser.button_click_name('commit')	
# 		flag = browser.find_link_by_href('/admin/roles').exists?
# 		if flag
# 			browser.Puts "Manage Roles check box is checked in and Roles is displayed  , Passed"
# 			Assertions.assertequal(true,true,"Manage Roles check box is checked in and Roles is displayed  Passed")

# 		else
# 			browser.Puts "Manage Roles check box is checked in and Roles is not displayed , Failed "
# 			Assertions.assertequal(true,true,"Manage Roles check box is checked in and Roles is not displayed Failed ")

# 		end
		
# end
# browser.close

# if manage_roles_and_permissions == 'clear'
# 	browser = Browser.new(url)
# 		browser.Puts browser.get_browser_title
# 	browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 	browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 	browser.button_click_name('commit')	
# 		flag = browser.find_link_by_href('/admin/roles').exists?
# 		if flag
# 			browser.Puts "Manage Roles check box is not checked in and Roles is displayed  , Failed"
# 			Assertions.assertequal(true,false,"Manage Roles check box is not checked in and Roles is displayed  Failed")

# 		else
# 			browser.Puts "Manage Roles check box is not checked in and Roles is not displayed , Passed "
# 			Assertions.assertequal(true,true,"Manage Roles check box is not checked in and Roles is not displayed , Passed ")

# 		end
# 		browser.close
# end
# 	browser.close

#  if view_workers == 'set'
# 		browser = Browser.new(url)
# 		browser.Puts browser.get_browser_title
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')	
# 		flag = browser.find_link_by_href('/admin/workers').exists? # finds the existence of the worker link
# 		if flag
# 			browser.Puts "View worker check box is  checked in and Worker link/text  is displayed on the screen , Passed"
# 			Assertions.assertequal(true,true,'View worker check box is  checked in and Worker link/text  is displayed on the screen  Passed')

# 		else
# 			browser.Puts "View worker check box is  checked in and worker is not displayed on the screen , Failed"
# 			Assertions.assertequal(true,false,'View worker check box is  checked in and worker is not displayed on the screen Failed')

# 		end
# 		browser.click_link_by_href('/admin/workers')
# 		browser.fill_input_text_by_class('span2',worker_id) # enters desire user id in the text box
#    	browser.press_enter
#    	sleep 1
#    	flag = browser.find_link_by_href('/admin/workers/2336').exists?
#    	sleep 1
#    	if flag
#    		browser.click_link_by_href('/admin/workers/2336')
#    		browser.Puts "User #{prod_usr_name} is able to click on the worker link and View Passed"
#    		Assertions.assertequal(true,true,"User #{prod_usr_name} is able to click on the worker link and View Passed")

#    	else
#    		browser.Puts "User #{prod_usr_name} is unable to click on the worker link and View Failed"
#    		Assertions.assertequal(true,false,"User #{prod_usr_name} is unable to click on the worker link and View Failed")

#    	end

# 		browser.close

# 	elsif view_workers == 'clear'
# 		browser = Browser.new(url)
# 		browser.Puts browser.get_browser_title
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')	
# 		flag = browser.find_link_by_href('/admin/workers').exists? # finds the existence of the worker link
# 		if flag
# 			browser.Puts "View worker check box is not checked in and Worker link/text  is displayed on the screen , Failed"
# 			Assertions.assertequal(true,false,'View worker check box is not checked in and Worker link/text  is displayed on the screen Failed')

# 		else
# 			browser.Puts "View worker check box is not  checked in and worker is not displayed on the screen , Passed"
# 			Assertions.assertequal(true,true, 'View worker check box is not  checked in and worker is not displayed on the screen Passed')

# 		end
# 			browser.close
# end
# 	browser.close
# if edit_workers == 'set'
# 	if view_workers == 'clear'
# 		browser.Puts "view_workers check box is not checked in  , hence the Worker link is not visible , "
# 		browser.Puts " To test Edit worker view_workers check box  needs to be checked in , please retry"
		
# 	else
# 		browser = Browser.new(url)
# 		browser.Puts browser.get_browser_title
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')	
# 		browser.click_link_by_href('/admin/workers')
# 		flag = browser.find_link_by_href('/admin/workers/new').exists? # finds the existence of create worker button
# 			if flag 
# 			browser.Puts "Edit worker check box is checked in and worker can view Create worker button Passed"
# 			Assertions.assertequal(true,true,'Edit worker check box is checked in and worker can view Create worker button Passed')

# 			else
# 			browser.Puts "Edit worker check box is checked in and create worker button is not visible Failed"
# 			Assertions.assertequal(true,false,'Edit worker check box is checked in and create worker button is not visible Failed')

# 			end
# 			browser.click_link_by_href('/admin/workers/new')
			
# 			browser.Puts "User #{prod_usr_name} is able to click on Create Worker Passed"
# 				Assertions.assertequal(true,true,"User #{prod_usr_name} is able to click on Create Worker Passed")
# 			browser.click_link_by_href('/admin/workers')
# 			browser.fill_input_text_by_class('span2',worker_id) # enters desire user id in the text box
# 	   	browser.press_enter
# 	   	browser.click_link_by_href('/admin/workers/2336/edit')
# 	   #	browser.click_link_by_href('/admin/workers/62/edit') # clicks on the edit  on the workers'
# 			browser.Puts "User #{prod_usr_name} is able to click on Edit Worker Passed"
# 			Assertions.assertequal(true,true,"User #{prod_usr_name} is able to click on Edit Worker Passed")
# 			browser.click_link_by_href('/admin/workers')
# 			browser.fill_input_text_by_class('span2',worker_id) # enters desire user id in the text box
# 	   	browser.press_enter
# 	   	# flag = browser.find_link_by_href(worker_id).exists?
# 	   	# browser.Puts flag
# 		   # 	if flag
# 		browser.click_link_by_text(worker_id)
		 
# 	end 	
# 			browser.find_link_by_text('Disable')
# 			#click_link_by_xpath('/html/body/section/div[2]/div/div[1]/div[2]/div/a') #for disable button
			
# 			browser.Puts "User #{prod_usr_name} is able disable the worker"
# 				Assertions.assertequal(true,true,"User #{prod_usr_name} is able disable the worker")
# 			browser.js_popup
			
# browser.close
# elsif edit_workers == 'clear'
	
# 	if view_workers == 'clear'
# 			browser.Puts "view_workers check box is not checked in  , hence the Worker link is not visible , "
# 			browser.Puts " To test Edit worker view_workers check box  needs to be checked in , please retry"
# 			browser.close
# 	else
# 			browser = Browser.new(url)
# 				browser.Puts browser.get_browser_title
# 			browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 			browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 			browser.button_click_name('commit')	

# 		browser.click_link_by_href('/admin/workers')

# 		flag = browser.find_link_by_href('/admin/workers/new').exists? # finds the existence of create worker button
# 			if flag 
# 				browser.Puts "Edit worker check box is not checked in and worker can view Create worker button Failed"
# 					Assertions.assertequal(true,false,"Edit worker check box is not checked in and worker can view Create worker button Failed")
# 			else
# 				browser.Puts "Edit worker check box is not checked in and create worker button is not visible Passed"
# 					Assertions.assertequal(true,true,"Edit worker check box is not checked in and create worker button is not visible Passed")
				
# 			end

# 			 flag = browser.find_link_by_href('/admin/workers/62/edit').exists?
# 			 if flag 
# 				 browser.Puts "User #{prod_usr_name} is able to find on Edit Worker Failed"
# 				 	Assertions.assertequal(true,false,"User #{prod_usr_name} is able to find on Edit Worker Failed")
				
# 			 else
# 				 browser.Puts "User #{prod_usr_name} is not able to find on Edit Worker Passed"	
# 				 	Assertions.assertequal(true,true,"User #{prod_usr_name} is not able to find on Edit Worker Passed")
# 	 		 end
# 	 	browser.click_link_by_href('/admin/workers')
# 		browser.fill_input_text_by_class('span2',worker_id) # enters desire user id in the text box
#    	browser.press_enter
#    	sleep 1
#    	flag = browser.find_link_by_text(worker_id).exists?
#    	sleep 1
#    	if flag
#    		browser.click_link_by_text(worker_id)

#    		browser.Puts "User #{prod_usr_name} is able to click on the worker link and View Passed"
#    			Assertions.assertequal(true,true,"User #{prod_usr_name} is able to click on the worker link and View Passed")
#    	else
#    		browser.Puts "User #{prod_usr_name} is unable to click on the worker link and View Failed"
#    			Assertions.assertequal(true,false,"User #{prod_usr_name} is unable to click on the worker link and View Failed")
#    	end

#    	flag = browser.find_link_by_xpath('/html/body/section/div[2]/div/div[1]/div[2]/div/a').exists? #for disable button
# 		if flag
# 			browser.Puts "User #{prod_usr_name} is  able to find disable the worker button Failed"
# 				Assertions.assertequal(true,false,"User #{prod_usr_name} is  able to find disable the worker button Failed")
# 		else
# 			browser.Puts "User #{prod_usr_name} is not able to find disable the worker button Passed"
# 				Assertions.assertequal(true,true,"User #{prod_usr_name} is not able to find disable the worker button Passed")
# 		end
# 	 		end

# browser.close
# ####################################not complete .... TBD@@@@@@@@@@@

# 																############ 	if assign_edit_worker_skills == 'set'
# 																############ 		if view_workers == 'clear'
# 																############ 			browser.Puts "view_workers check box is not checked in  , hence the Worker link is not visible , "
# 																############ 			browser.Puts " To test Edit worker view_workers check box  needs to be checked in , please retry"
# 																############ 			browser.close
# 																############ 		else
# 																############ 			browser = Browser.new(url)
# 																############ 			browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 																############ 			browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 																############ 			browser.button_click_name('commit')	
# ###########
# 																############ 			browser.click_link_by_href('/admin/workers')
# 																############ 			browser.fill_input_text_by_class('span2',worker_id) # enters desire user id in the text box
# 																############ 	   	browser.press_enter
# 																###########		
# 																############ 			flag = browser.find_link_by_href('#skill_temp').exists?  # verifies the existence of add skill button
# 																############ 				if flag
# 																############ 					browser.Puts "User #{prod_usr_name} is able to view Add Skill button Passed"
# ###########
# 																############ 					browser.click_link_by_href('#skill_temp')
# 																############ 					browser.click_span_class('filter-option pull-left')
# 																############ 					sleep 1
# 																############ 					browser.fill_input_text_by_class('input-block-level form-control', skill)
# 																############ 					browser.click_by_a(skill)
# 																############ 					browser.click_link_by_text('Submit')
# ###########
# 																############ 				else
# 																############ 					browser.Puts "User #{prod_usr_name} is not able to view Add Skill button Failed"
# 																############ 					browser.close
# 																############ 				end
# ###########
# 																############ 				browser.fill_input_text_by_class('span2',add_skill)
# 																############ 				browser.press_enter
# ###########
# 																############ 		 		browser.Puts "User #{prod_usr_name} is able to search the skill in workers page skill tab."
# ###########
# 																############ 		 		browser.clear_text_field_by_id('skill_field_46')
# ###########
# 																############ 		 		fill_input_text_by_id('skill_field_46', 0.93)
# 																############ 		 		browser.press_enter
# ###########
# 																############ 		 		#enabling and disabling worker skill pending
# ###########
# 																############ 		 		browser.close
# 																############ end
# 																############ 	end
# ###########

# if view_skills == 'set'
# 		browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')
# 		flag = browser.find_link_by_href('/admin/skills').exists?
# 		if flag
# 			browser.Puts "view_skills check box is checked in and Skill is displayed on the screen , Passed"
# 				Assertions.assertequal(true,true,"view_skills check box is checked in and Skill is displayed on the screen  Passed")
# 		else
# 			browser.Puts "view_skills check box is checked in and skill is not displayed on the screen , Failed"
# 				Assertions.assertequal(true,false,"view_skills check box is checked in and skill is not displayed on the screen  Failed")
# 		end
# 		browser.close
# elsif view_skills == 'clear'
# 		browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')		
# 		flag = browser.find_link_by_href('/admin/skills').exists?
# 		if flag
# 		browser.Puts "view_skills check box is not checked in and Skill is displayed on the screen , Failed"
# 			Assertions.assertequal(true,false,"view_skills check box is not checked in and Skill is displayed on the screen  Failed")
# 		else
# 		browser.Puts "view_skills check box is not checked in and skill is not displayed on the screen , Passed"
# 		Assertions.assertequal(true,true,"view_skills check box is not checked in and skill is not displayed on the screen  Passed")
# 		end
# 		browser.close
# end	

# browser.close
# if create_new_skills == 'set'
# 		browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')
# 		flag = browser.find_link_by_href('/admin/skills').exists?
# 		if flag
# 			browser.Puts "view_skills check box is checked in and Skill is displayed on the screen , Passed"
# 			Assertions.assertequal(true,true,"view_skills check box is checked in and Skill is displayed on the screen  Passed")
			
# 			browser.click_link_by_href('/admin/skills') # clicks on Skill link (button)
# 			browser.click_link_by_href('/admin/skills/new') # clicks on  Add skill button
# 			browser.fill_input_text_by_name('name', prodskill) # A user inbrowser.Puts new skill to be added . Data is in datafile with name prodskill
# 			browser.click_text_field_user('/admin/skills','//*[@id="fancybox-inner"]/div/form/fieldset/p[3]/input') # clicks on the Add button/image/lins
			
# 			browser.click_link_by_text(prodskill)# verifies a user is able is click on the  skilled just created by the user . 
		
# 			browser.Puts "User #{prod_usr_name}  is able to click on the skill just created ."
# 			browser.wait_till_load(5)
# 			browser.fancy_box_close('fancybox-close')
# 			browser.press_esc
# 		else
# 			browser.Puts "view_skills check box is checked in and skill is not displayed on the screen , Failed"
# 				Assertions.assertequal(true,false,"view_skills check box is checked in and skill is not displayed on the screen Failed")
# 		browser.close
# 	end
# elsif create_new_skills == 'clear'

# 		browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')		
# 		flag = browser.find_link_by_href('/admin/skills').exists?
# 		if flag
# 			browser.Puts "view_skills check box is checked in and Skill is displayed on the screen Passed"
# 			Assertions.assertequal(true,true,"view_skills check box is checked in and Skill is displayed on the screen  Passed")
# 			browser.click_link_by_href('/admin/skills') # clicks on Skill link (button)
# 			flag = browser.find_link_by_href('/admin/skills/new').exists? # clicks on Skill link (button)
# 			if flag
# 				browser.Puts "create_new_skills is clear and User #{prod_usr_name} is able to find create skill button Failed"
# 					Assertions.assertequal(true,false,"create_new_skills is clear and User #{prod_usr_name} is able to find create skill button Failed")
# 			else
# 				browser.Puts "create_new_skills is clear and User #{prod_usr_name} is not able to find create skill button Passed"
# 					Assertions.assertequal(true,true,"create_new_skills is clear and User #{prod_usr_name} is not able to find create skill button Passed")
# 			end
# 		else				
# 			browser.Puts "Manage skills check box is checked in and skill is not displayed on the screen , Failed"
# 				Assertions.assertequal(true,false,"Manage skills check box is checked in and skill is not displayed on the screen  Failed")
# 		end
# 		browser.close
# end	
# browser.close
# if edit_skills == 'set'

# 	browser = Browser.new(url)
# 	browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 	browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 	browser.button_click_name('commit')
# 	flag = browser.find_link_by_href('/admin/skills').exists?
# 	if flag
# 		browser.Puts "view_skills check box is checked in and Skill is displayed on the screen , Passed"
# 			Assertions.assertequal(true,true,"view_skills check box is checked in and Skill is displayed on the screen  Passed")	
# 		browser.click_link_by_href('/admin/skills') # clicks on Skill link (button)

# 		browser.fill_input_text_by_class('span2', add_skill)
# 		browser.press_enter
# 		browser.click_link_by_text(add_skill)
# 		browser.fill_input_text_by_name('name', add_skill) # A user inbrowser.Puts new skill to be added . Data is in datafile with name prodskill
# 		flag = browser.find_text_field_user('/admin/skills/46','//*[@id="fancybox-inner"]/div/form/fieldset/p[3]/input')
# 			if flag 
# 				browser.Puts "edit_skill check box is checked in and Update button is displayed Passed"
# 					Assertions.assertequal(true,true,"edit_skill check box is checked in and Update button is displayed Passed")
# 				browser.fancy_box_close('fancybox-close')
# sleep 1
# 				browser.fill_input_text_by_class('span2', add_skill)
# 				browser.press_enter
# 				browser.click_link_by_text(add_skill)
# 				#browser.clear_text_field_by_id('name')
# 				browser.fill_input_text_by_id('name',add_skill)
# 				browser.click_text_field_user('/admin/skills/46','//*[@id="fancybox-inner"]/div/form/fieldset/p[3]/input') # clicks on the Add button/image/lins
# 				browser.fill_input_text_by_class('span2', add_skill)
# 				browser.press_enter
# 				browser.click_link_by_text(add_skill)# verifies a user is able is click on the  skilled just created by the user .

# 					flag = browser.find_link_by_href('/admin/skills/46/download_csv').exists?
# 					if flag
# 						browser.Puts "edit_skill check box is checked and download_csv button is seen Passed"
# 							Assertions.assertequal(true,true,"edit_skill check box is checked and download_csv button is seen Passed")
# 					else
# 						browser.Puts "edit_skill check box is checked and download_csv button is not seen Failed"
# 							Assertions.assertequal(true,false,"edit_skill check box is checked and download_csv button is not seen Failed")
# 					end
# 			else
# 			browser.Puts "edit_skill check box is not  checked in and Update button is displayed Failed"
# 				Assertions.assertequal(true,false,"edit_skill check box is not  checked in and Update button is displayed Failed")
# 			end
# 	end
# browser.close
# 	elsif edit_skills == 'clear'
# 		browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')
# 		flag = browser.find_link_by_href('/admin/skills').exists?
# 		if flag
# 			browser.Puts 'view_skills check box is checked in and Skill is displayed on the screen , Passed'
# 			Assertions.assertequal(true,true,'view_skills check box is checked in and Skill is displayed on the screen  Passed')
# 			browser.click_link_by_href('/admin/skills') # clicks on Skill link (button)
# 			browser.fill_input_text_by_class('span2', add_skill)
# 			browser.press_enter
# 			flag = browser.find_link_by_href('/admin/skills/46/download_csv').exists?
# 			if flag
# 				browser.Puts "edit_skill check box is clear and download_csv button is seen Failed"
# 				Assertions.assertequal(true,false,"edit_skill check box is clear and download_csv button is seen Failed")
# 			else
# 				browser.Puts "edit_skill check box is clear and download_csv button is not seen Passed"
# 				Assertions.assertequal(true,true,"edit_skill check box is clear and download_csv button is not seen Passed")
# 				end
# 		browser.close
# 	end
# 	end
# browser.close







# if upload_workers_or_modify_skills_in_mass == 'set'

# 	browser = Browser.new(url)
# 	browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 	browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 	browser.button_click_name('commit')
# 	flag = browser.find_link_by_href('/admin/skills').exists?
# 		if flag
# 		browser.Puts "view_skills check box is checked in and Skill is displayed on the screen , Passed"
# 			Assertions.assertequal(true,true,"view_skills check box is checked in and Skill is displayed on the screen  Passed")
			
# 		browser.click_link_by_href('/admin/skills') # clicks on Skill link (button)

# 			flag = browser.find_link_by_href('/admin/skills/46/upload_csv').exists?
# 				if flag
# 					browser.Puts "upload_workers_or_modify_skills_in_mass check box is checked and upload_csv button is seen Passed"
# 						Assertions.assertequal(true,true,"upload_workers_or_modify_skills_in_mass check box is checked and upload_csv button is seen Passed")
# 				else
# 					browser.Puts "upload_workers_or_modify_skills_in_mass check box is checked and upload_workers_or_modify_skills_in_mass button is not seen Failed"
# 						Assertions.assertequal(true,false,"upload_workers_or_modify_skills_in_mass check box is checked and upload_workers_or_modify_skills_in_mass button is not seen Failed")
# 				end
# 		end
# 		browser.close
# elsif upload_workers_or_modify_skills_in_mass == 'clear'
# 	browser = Browser.new(url)
# 	browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 	browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 	browser.button_click_name('commit')
# 	flag = browser.find_link_by_href('/admin/skills').exists?
# 		if flag
# 		browser.Puts "view_skills check box is checked in and Skill is displayed on the screen , Passed"
# 			Assertions.assertequal(true,true,"view_skills check box is checked in and Skill is displayed on the screen , Passed")
# 		browser.click_link_by_href('/admin/skills') # clicks on Skill link (button)
# 			flag = browser.find_link_by_href('/admin/skills/46/upload_csv').exists?
# 				if flag
# 					browser.Puts "upload_workers_or_modify_skills_in_mass check box is not checked and upload_csv button is seen Failed"
# 						Assertions.assertequal(true,false,"upload_workers_or_modify_skills_in_mass check box is not checked and upload_csv button is seen Failed")
# 				else
# 					browser.Puts "upload_workers_or_modify_skills_in_mass check box is not checked and upload_workers_or_modify_skills_in_mass button is not seen Passed"
# 						Assertions.assertequal(true,true,"upload_workers_or_modify_skills_in_mass check box is not checked and upload_workers_or_modify_skills_in_mass button is not seen Passed")
# 				end
# 		end
# 	end	
# 	browser.close
# if view_reports_all == 'set'
# 		browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')	
# 		flag = browser.find_link_by_href('/admin/reports').exists?
# 			if flag
# 				browser.Puts "view_reports_all check box is checked and reports is seen Passed"
# 					Assertions.assertequal(true,true,"view_reports_all check box is checked and reports is seen Passed")
# 				sleep 1
# 				browser.click_link_by_href('/admin/reports')
# 				browser.button_click_class('btn dropdown-toggle selectpicker btn-default')
# 				browser.fill_input_text_by_class('input-block-level form-control', 'All')# should be in the data file . a proper one 
# 				browser.press_enter
# 				browser.Puts "User #{prod_usr_name} is able to click  Accounts drop down  and select the option from the list "
# 					Assertions.assertequal(true,true,"User #{prod_usr_name} is able to click  Accounts drop down  and select the option from the list ")
# 				browser.click_span_text('Select Line') # clicks on select line drop down .
# 				browser.Puts "User #{prod_usr_name} is able to click  Select Line drop down."
# 				browser.click_text_field_id('report_date_filter')
# 				browser.button_click_text('Submit')
# 				browser.Puts "User #{prod_usr_name} is able to click  on the Date."
# 			else
# 				browser.Puts "view_reports_all check box is checked and reports is not seen Failed"
# 					Assertions.assertequal(true,false,"view_reports_all check box is checked and reports is not seen Failed")
# 			end
# 		browser.close
# elsif view_reports_all == 'clear'
# 		browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')	
# 		flag = browser.find_link_by_href('/admin/lines/227/overview').exists?
# 		if flag 
# 			browser.Puts "view_reports_all check box is not checked in , Reports button is displayed Failed"
# 				Assertions.assertequal(true,false,"view_reports_all check box is not checked in , Reports button is displayed Failed")
# 		else
# 		browser.Puts "view_reports_all check box is not checked in , Reports button is not displayed , Passed"
# 			Assertions.assertequal(true,true,"view_reports_all check box is not checked in , Reports button is not displayed  Passed")
# 		end
# 		browser.close
# end

# # ###################View Reports Assigned is TBD
# # ###################Currently view accounts all can be tested manually only

# browser.close
# if view_accounts_assigned == 'set'
# 		###username = env_setting['username_cf']
# 		browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')

# 		flag = browser.find_link_by_href('/admin/accounts').exists?
# 		if flag
# 			browser.Puts "view_accounts_assigned check box is checked, and Accounts link is displayed , Passed "
# 				Assertions.assertequal(true,true,"view_accounts_assigned check box is checked, and Accounts link is displayed Passed ")
# 			browser.click_link_by_href('/admin/accounts')
# 			browser.index_fill_input_text(2,account_exist) # account_exist should be the one where the username_cf  belongs to this account 
# 			browser.press_enter

# 			browser.click_link_by_text(account_exist)

# 			browser.fill_input_text_by_class_index(2, 'form-control', prod_usr_name) # Searching your own user name in 1st account to verify the assigned account is displayed
# 			browser.press_enter

# 			table_value = browser.get_value_table_withindexandid(1,1)
# 				if table_value == prod_usr_name
# 					browser.Puts "view_accounts_assigned check box is checked, and user is displayed under the #{account_exist} , Passed"
# 						Assertions.assertequal(true,false,"view_accounts_assigned check box is checked, and user is displayed under the #{account_exist} Passed")
# 				else 
# 					browser.Puts "view_accounts_assigned check box is checked, and user is not displayed under the #{account_exist} , Failed"
# 						Assertions.assertequal(true,false,"view_accounts_assigned check box is checked, and user is not displayed under the #{account_exist}  Failed")
# 				end
# 			browser.click_link_by_href('/admin/accounts')
# 		else
# 			browser.Puts "view_accounts_assigned  check box is checked , and Accounts lnk is not displayed , Failed"
# 				Assertions.assertequal(true,false,"view_accounts_assigned  check box is checked , and Accounts lnk is not displayed Failed")
# 		end
# 		browser.close

# elsif view_accounts_assigned == 'clear'
# 	browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')

# 	flag = browser.find_link_by_href('/admin/accounts').exists?
# 	if flag
# 		browser.Puts "view_accounts_assigned check box is not checked, and Accounts link is not displayed , Failed "
# 			Assertions.assertequal(true,false,"view_accounts_assigned check box is not checked, and Accounts link is not displayed , Failed ")
# 	else
# 		browser.Puts "view_accounts_assigned check box is not checked, and Accounts link is not displayed , Passed "
# 			Assertions.assertequal(true,true,"view_accounts_assigned check box is not checked, and Accounts link is not displayed , Passed ")
# 	end
# 	browser.close
# end
# browser.close
# if edit_accounts_all == 'set'
# 			#username = env_setting['username_cf']
# 		browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')

# 		flag = browser.find_link_by_href('/admin/accounts').exists?
# 		if flag
# 			browser.Puts "view_accounts_assigned check box is checked, and Accounts link is displayed , Passed "
# 				Assertions.assertequal(true,true,"view_accounts_assigned check box is checked, and Accounts link is displayed , Passed ")
# 			browser.click_link_by_href('/admin/accounts')
# 			browser.index_fill_input_text(2,account_exist) # account_exist should be the one where the username_cf  belongs to this account 
# 			browser.press_enter
# 			browser.click_link_by_text(account_exist)
# 			flag = browser. find_link_by_href('#user_temp').exists?
# 			if flag 
# 				browser.Puts "edit_accounts_all is checked in  #{prod_usr_name} is able to  see User button Passed."
# 					Assertions.assertequal(true,true,"edit_accounts_all is checked in  #{prod_usr_name} is able to  see User button Passed.")
# 			else 
# 				browser.Puts "edit_accounts_all is checked in  #{prod_usr_name} is not able to  see User button Failed."
# 					Assertions.assertequal(true,false,"edit_accounts_all is checked in  #{prod_usr_name} is not able to  see User button Failed.")
				
# 			end
# 			flag = browser. find_link_by_href('#lines_temp').exists?
# 				if flag 
# 				browser.Puts "edit_accounts_all is checked in  #{prod_usr_name} is able to  see Add Lines button Passed."
# 					Assertions.assertequal(true,true,"edit_accounts_all is checked in  #{prod_usr_name} is able to  see Add Lines button Passed.")
				
# 				else 
# 				browser.Puts "edit_accounts_all is checked in  #{prod_usr_name} is not able to  see Add Lines button Failed."
# 					Assertions.assertequal(true,false,"edit_accounts_all is checked in  #{prod_usr_name} is not able to  see Add Lines button Failed.")
# 				browser.close
# 				end
# 		else
# 			browser.Puts "view_accounts_assigned  check box is checked , and Accounts lnk is not displayed , Failed"
# 				Assertions.assertequal(true,false,"view_accounts_assigned  check box is checked , and Accounts lnk is not displayed , Failed")
# 		end
# browser.close


# elsif edit_accounts_all == 'clear'
# 		username = env_setting['username_cf']
# 		browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')

# 		flag = browser.find_link_by_href('/admin/accounts').exists?
# 		if flag
# 			browser.Puts "view_accounts_assigned check box is checked, and Accounts link is displayed , Passed "
# 				Assertions.assertequal(true,true,"view_accounts_assigned check box is checked, and Accounts link is displayed , Passed ")
# 			browser.click_link_by_href('/admin/accounts')
# 			browser.index_fill_input_text(2,account_exist) # account_exist should be the one where the username_cf  belongs to this account 
# 			browser.press_enter
# 			browser.click_link_by_text(account_exist)
# 			flag = browser. find_link_by_href('#user_temp').exists?
# 			if flag 
# 				browser.Puts "edit_accounts_all is not checked in  #{prod_usr_name} is able to  see User button Failed."
# 					Assertions.assertequal(true,false,"edit_accounts_all is not checked in  #{prod_usr_name} is able to  see User button Failed.")
# 			else 
# 				browser.Puts "edit_accounts_all is not checked in  #{prod_usr_name} is not able to  see User button Passed."
# 					Assertions.assertequal(true,true,"edit_accounts_all is not checked in  #{prod_usr_name} is not able to  see User button Passed.")
				
# 			end
# 			flag = browser. find_link_by_href('#lines_temp').exists?
# 			if flag 
# 				browser.Puts "edit_accounts_all is not checked in  #{prod_usr_name} is able to  see Add Lines  button Failed."
# 					Assertions.assertequal(true,false,"edit_accounts_all is not checked in  #{prod_usr_name} is able to  see Add Lines  button Failed.")
# 			else 
# 				browser.Puts "edit_accounts_all is not checked in  #{prod_usr_name} is not able to  see Add Lines button Passed."
# 					Assertions.assertequal(true,true,"edit_accounts_all is not checked in  #{prod_usr_name} is not able to  see Add Lines button Passed.")
# 				browser.close
# 			end
# 		else
# 			browser.Puts "view_accounts_assigned  check box is not checked , and Accounts lnk is not displayed , Passed"
# 				Assertions.assertequal(true,true,"view_accounts_assigned  check box is not checked , and Accounts lnk is not displayed Passed")
# 		end
# 	end
# browser.close
# 	if edit_accounts_assigned == 'set'

# 		browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')

# 		flag = browser.find_link_by_href('/admin/accounts').exists?
# 		if flag
# 			browser.Puts "view_accounts_assigned check box is checked, and Accounts link is displayed , Passed "
# 				Assertions.assertequal(true,true,"view_accounts_assigned check box is checked, and Accounts link is displayed  Passed ")
# 			browser.click_link_by_href('/admin/accounts')
# 			browser.index_fill_input_text(2,account_exist) # account_exist should be the one where the username_cf  belongs to this account 
# 			browser.press_enter
# 			browser.click_link_by_text(account_exist)
# 			browser.click_link_by_href('/admin/accounts')
# 			browser.index_fill_input_text(2,account_exist) # account_exist should be the one where the username_cf  belongs to this account 
# 			browser.press_enter
# 			browser.click_link_by_text(account_exist)

# 			browser.fill_input_text_by_class_index(2, 'form-control', prod_usr_name) # Searching your own user name in 1st account to verify the assigned account is displayed
# 			browser.press_enter


# 			table_value = browser.get_value_table_withindexandid(1,1)
# 				if table_value == prod_usr_name 
# 						browser.Puts "view_accounts_assigned check box is checked, and user is displayed under the #{account_exist} , Passed"
# 							Assertions.assertequal(true,true,"view_accounts_assigned check box is checked, and user is displayed under the #{account_exist} Passed")
# 						flag = browser.find_link_by_href('#user_temp').exists?
# 							if flag 
# 							browser.Puts "edit_accounts_all is checked in  #{prod_usr_name} is able to  see User button Passed."
# 								Assertions.assertequal(true,true,"edit_accounts_all is checked in  #{prod_usr_name} is able to  see User button Passed.")
# 							else 
# 							browser.Puts "edit_accounts_all is checked in  #{prod_usr_name} is not able to  see User button Failed."
# 								Assertions.assertequal(true,false,"edit_accounts_all is checked in  #{prod_usr_name} is not able to  see User button Failed.")
# 							end
# 							flag = browser.find_link_by_href('#lines_temp').exists?
# 							if flag 
# 							browser.Puts "edit_accounts_all is checked in  #{prod_usr_name} is able to  see Add Lines button Passed."
# 								Assertions.assertequal(true,true,"edit_accounts_all is checked in  #{prod_usr_name} is able to  see Add Lines button Passed.")
# 							else 
# 							browser.Puts "edit_accounts_all is checked in  #{prod_usr_name} is not able to  see Add Lines button Failed."
# 								Assertions.assertequal(true,false,"edit_accounts_all is checked in  #{prod_usr_name} is not able to  see Add Lines button Failed.")
# 							end
# 				else 
# 					browser.Puts "view_accounts_assigned check box is checked, and user is not displayed under the #{account_exist} , Failed"
# 						Assertions.assertequal(true,false,"view_accounts_assigned check box is checked, and user is not displayed under the #{account_exist}  Failed")
				
# 				end
# 				browser.close

# 				if view_accounts_all == 'set'

# 						browser.click_link_by_href('/admin/accounts')
# 						browser.fill_input_text_by_class('span2', account_not_exist) # account_not_exist should be the one where the username_cf does not belong to this account 
# 						browser.press_enter

# 							browser.click_link_by_text(account_not_exist)
# 						browser.fill_input_text_by_class_index(1, 'span2', 'username_cf') # Searching your own user name in 1st account to verify the assigned account is displayed
# 						browser.press_enter

# 						table_value = browser.validating_empty_table_secondtable('dataTables_empty')
# 						if table_value == prod_usr_name
# 						browser.Puts "view_accounts_assigned check box is checked, and user is displayed under the #{account_not_exist} , Failed"
# 							Assertions.assertequal(true,false,"view_accounts_assigned check box is checked, and user is displayed under the #{account_not_exist} , Failed")
# 						browser.close
# 						else 
# 						browser.Puts "view_accounts_assigned check box is checked, and user is not displayed under the #{account_not_exist} , Passed"
# 							Assertions.assertequal(true,true,"view_accounts_assigned check box is checked, and user is not displayed under the #{account_not_exist} , Passed")
						
# 						end
# 				else 
# 				browser.Puts "Since  view_accounts_all check box is not checked in This test cannot proceed further , please check in view account all check box and try again later"			
# 			end
				
# 		else
# 			browser.Puts "View_accounts_assigned  check box is checked , and Accounts lnk is not displayed , Failed"
# 				Assertions.assertequal(true,false,"View_accounts_assigned  check box is checked , and Accounts lnk is not displayed , Failed")
# 		end
	
# 		browser.close
# elsif edit_accounts_assigned == 'clear'
		
# 		browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')

# 		flag = browser.find_link_by_href('/admin/accounts').exists?
# 		if flag
# 			browser.Puts "view_accounts_assigned check box is checked, and Accounts link is displayed , Passed "
# 				Assertions.assertequal(true,true,"view_accounts_assigned check box is checked, and Accounts link is displayed , Passed ")
# 			browser.click_link_by_href('/admin/accounts')
# 			browser.index_fill_input_text(2,account_exist) # account_exist should be the one where the username_cf  belongs to this account 
# 			browser.press_enter
# 			browser.click_link_by_text(account_exist)
# 			flag = browser. find_link_by_href('#user_temp').exists?
# 			if flag 
# 				browser.Puts "edit_accounts_all is not checked in  #{prod_usr_name} is able to  see User button Failed."
# 					Assertions.assertequal(true,false,"edit_accounts_all is not checked in  #{prod_usr_name} is able to  see User button Failed.")
# 			else 
# 				browser.Puts "edit_accounts_all is not checked in  #{prod_usr_name} is not able to  see User button Passed."
# 					Assertions.assertequal(true,true,"edit_accounts_all is not checked in  #{prod_usr_name} is not able to  see User button Passed.")
				
# 			end
# 			flag = browser. find_link_by_href('#lines_temp').exists?
# 			if flag 
# 				browser.Puts "edit_accounts_all is not checked in  #{prod_usr_name} is able to  see Add Lines  button Failed."
# 					Assertions.assertequal(true,false,"edit_accounts_all is not checked in  #{prod_usr_name} is able to  see Add Lines  button Failed.")
# 			else 
# 				browser.Puts "edit_accounts_all is not checked in  #{prod_usr_name} is not able to  see Add Lines button Passed."
# 					Assertions.assertequal(true,true,"edit_accounts_all is not checked in  #{prod_usr_name} is not able to  see Add Lines button Passed.")
# 				browser.close
# 			end
# 		else
# 			browser.Puts "view_accounts_assigned  check box is not checked , and Accounts lnk is not displayed , Passed"
# 				Assertions.assertequal(true,true,"view_accounts_assigned  check box is not checked , and Accounts lnk is not displayed , Passed")
# 		end
# 	end
# 	browser.close
# #  'delete_accounts_all' , 'delete_accounts_assigned' TBD
# if associate_users_all == 'set'
# 	username = env_setting['username_cf']
# 	browser = Browser.new(url)
# 	browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 	browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 	browser.button_click_name('commit')

# 	flag = browser.find_link_by_href('/admin/accounts').exists?
# 		if flag
# 			browser.Puts "view_accounts_assigned check box is checked, and Accounts link is displayed , Passed "
# 				Assertions.assertequal(true,true,"view_accounts_assigned check box is checked, and Accounts link is displayed , Passed ")
# 			browser.click_link_by_href('/admin/accounts')
# 			browser.index_fill_input_text(2,account_exist) # account_exist should be the one where the username_cf  belongs to this account 
# 			browser.press_enter
# 			browser.click_link_by_text(account_exist)
# 			flag = browser. find_link_by_href('#user_temp').exists?
# 			if flag 
# 				browser.Puts "associate_users_all is checked in  #{prod_usr_name} is able to  see User button Passed."
# 					Assertions.assertequal(true,true,"associate_users_all is checked in  #{prod_usr_name} is able to  see User button Passed.")
# 			else 
# 				browser.Puts "associate_users_all is checked in  #{prod_usr_name} is not able to  see User button Failed."
# 					Assertions.assertequal(true,false,"associate_users_all is checked in  #{prod_usr_name} is not able to  see User button Failed.")
# 			end

# 		else
# 				browser.Puts "view_accounts_assigned  check box is checked , and Accounts lnk is not displayed , Failed"
# 					Assertions.assertequal(true,false,"view_accounts_assigned  check box is checked , and Accounts lnk is not displayed , Failed")
		
# 		end
# 		browser.close

# elsif associate_users_all == 'clear'
# 		username = env_setting['username_cf']
# 		browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')

# 		flag = browser.find_link_by_href('/admin/accounts').exists?
# 		if flag
# 			browser.Puts "view_accounts_assigned check box is checked, and Accounts link is displayed , Passed "
# 				Assertions.assertequal(true,true,"view_accounts_assigned check box is checked, and Accounts link is displayed , Passed ")
# 			browser.click_link_by_href('/admin/accounts')
# 			browser.index_fill_input_text(2,account_exist) # account_exist should be the one where the username_cf  belongs to this account 
# 			browser.press_enter
# 			browser.click_link_by_text(account_exist)
# 			flag = browser. find_link_by_href('#user_temp').exists?
# 			if flag 
# 				browser.Puts "associate_users_all is not checked in  #{prod_usr_name} is able to  see User button Failed."
# 					Assertions.assertequal(true,false,"associate_users_all is not checked in  #{prod_usr_name} is able to  see User button Failed.")
# 			else 
# 				browser.Puts "associate_users_all is not checked in  #{prod_usr_name} is not able to  see User button Passed."
# 					Assertions.assertequal(true,true,"associate_users_all is not checked in  #{prod_usr_name} is not able to  see User button Passed.")
				
# 			end
# 		else
# 			browser.Puts "View_accounts_assigned  check box is not  checked , and Accounts lnk is not displayed , Passed"
# 				Assertions.assertequal(true,true,"View_accounts_assigned  check box is not  checked , and Accounts lnk is not displayed , Passed")
# 		end
# 	end
# browser.close
# 	if associate_users_assigned == 'set'
# 		username = env_setting['username_cf']
# 		browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')

# 		flag = browser.find_link_by_href('/admin/accounts').exists?
# 		if flag
# 			browser.Puts "view_accounts_assigned check box is checked, and Accounts link is displayed , Passed "
# 				Assertions.assertequal(true,true,"view_accounts_assigned check box is checked, and Accounts link is displayed , Passed ")
# 			browser.click_link_by_href('/admin/accounts')
# 			browser.index_fill_input_text(2,account_exist) # account_exist should be the one where the username_cf  belongs to this account 
# 			browser.press_enter
# 			browser.click_link_by_text(account_exist)
# 			browser.click_link_by_href('/admin/accounts')
# 			browser.index_fill_input_text(2,account_exist) # account_exist should be the one where the username_cf  belongs to this account 
# 			browser.press_enter
# 			browser.click_link_by_text(account_exist)
# 			browser.fill_input_text_by_class_index(2, 'form-control', prod_usr_name) # Searching your own user name in 1st account to verify the assigned account is displayed
# 			browser.press_enter
# 			table_value = browser.get_value_table_withindexandid(1,1)
# 				if table_value == prod_usr_name 
				
# 					browser.Puts "view_accounts_assigned check box is checked, and user is displayed under the #{account_exist} , Passed"
# 						Assertions.assertequal(true,true,"view_accounts_assigned check box is checked, and user is displayed under the #{account_exist} , Passed")
# 					flag = browser. find_link_by_href('#user_temp').exists?
# 					if flag 
# 						browser.Puts "associate_users_assigned is checked in  #{prod_usr_name} is able to  see User button Passed."
# 							Assertions.assertequal(true,true,"associate_users_assigned is checked in  #{prod_usr_name} is able to  see User button Passed.")
# 					else 
# 						browser.Puts "associate_users_assigned is checked in  #{prod_usr_name} is not able to  see User button Failed."
# 							Assertions.assertequal(true,false,"associate_users_assigned is checked in  #{prod_usr_name} is not able to  see User button Failed.")
				
# 					end
					
# 				else 
# 					browser.Puts "view_accounts_assigned check box is checked, and user is not displayed under the #{account_exist} , Failed"
# 						Assertions.assertequal(true,false,"view_accounts_assigned check box is checked, and user is not displayed under the #{account_exist}  Failed")
# 					browser.close
# 				end

# 						if view_accounts_all == 'set'
# 					browser.click_link_by_href('/admin/accounts')
# 					browser.fill_input_text_by_class('span2', account_not_exist) # account_not_exist should be the one where the username_cf does not belong to this account 
# 					browser.press_enter
# 					browser.click_link_by_text(account_not_exist)
# 					browser.fill_input_text_by_class_index(2, 'form-control', prod_usr_name) # Searching your own user name in 1st account to verify the assigned account is displayed
# 					browser.press_enter

# 					table_value = browser.validating_empty_table_secondtable('dataTables_empty')
# 					if table_value == prod_usr_name
# 					browser.Puts "associate_users_assigned check box is checked, and user is displayed under the #{account_not_exist} , Failed"
# 						Assertions.assertequal(true,false,"associate_users_assigned check box is checked, and user is displayed under the #{account_not_exist}  Failed")
# 					browser.close
# 					else 
# 					browser.Puts "associate_users_assigned check box is checked, and user is NOT  displayed under the #{account_not_exist} , Passed"
# 						Assertions.assertequal(true,true,"associate_users_assigned check box is checked, and user is NOT  displayed under the #{account_not_exist}  Passed")
					
# 					end
# 				else 
# 					browser.Puts "view_accounts_all check box is not checked in , so further testing of associate_users_assigned roles is stopped , "
# 				end
# 		else
# 			browser.Puts "view_accounts_assigned  check box is checked , and Accounts lnk is not displayed , Failed"
# 				Assertions.assertequal(true,false,"view_accounts_assigned  check box is checked , and Accounts lnk is not displayed , Failed")
# 		end
# browser.close
		
# elsif associate_users_assigned == 'clear'
# 		username = env_setting['username_cf']
# 		browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')

# 		flag = browser.find_link_by_href('/admin/accounts').exists?
# 		if flag
# 			browser.Puts "view_accounts_assigned check box is checked, and Accounts link is displayed , Passed "
# 				Assertions.assertequal(true,true,"view_accounts_assigned check box is checked, and Accounts link is displayed , Passed ")
# 			browser.click_link_by_href('/admin/accounts')
# 			browser.index_fill_input_text(2,account_exist) # account_exist should be the one where the username_cf  belongs to this account 
# 			browser.press_enter
# 			browser.click_link_by_text(account_exist)
# 			flag = browser. find_link_by_href('#user_temp').exists?
# 			if flag 
# 				browser.Puts "associate_users_assigned is not checked in  #{prod_usr_name} is able to  see User button Failed."
# 					Assertions.assertequal(true,false,"associate_users_assigned is not checked in  #{prod_usr_name} is able to  see User button Failed.")
# 			else 
# 				browser.Puts "associate_users_assigned is not checked in  #{prod_usr_name} is not able to  see User button Passed."
# 					Assertions.assertequal(true,true,"associate_users_assigned is not checked in  #{prod_usr_name} is not able to  see User button Passed.")
# 			end
# 		else
# 			browser.Puts "view_accounts_assigned  check box is not  checked , and Accounts lnk is not displayed , Passed"
# 				Assertions.assertequal(true,true,"view_accounts_assigned  check box is not  checked , and Accounts lnk is not displayed  Passed")
# 		end
# 	end
# if  view_lines == 'set'
# 		browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')	
# 		flag = browser.find_link_by_href('/admin/lines').exists? # check the existence of production lines  link on the screen 
# 		if flag
# 			browser.Puts "view_lines check box is checked in , production lines link/text is visible  Passed"
# 				Assertions.assertequal(true,false,"view_lines check box is checked in , production lines link/text is visible  Passed")
# 		else 
# 			browser.Puts "view_lines  check box is  checked in , production lines link/text is not visible Failed"
# 				Assertions.assertequal(true,false,"view_lines  check box is  checked in , production lines link/text is not visible Failed")
# 		end
# 		browser.close

# elsif view_lines == 'clear'
# 		browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')	
# 		flag = browser.find_link_by_href('/admin/lines').exists? # check the existence of production lines  link on the screen 
# 		if flag
# 			browser.Puts "view_lines check box is not checked in , for #{prod_usr_name} production lines link/text is visible  Failed"
# 				Assertions.assertequal(true,false,"view_lines check box is not checked in , for #{prod_usr_name} production lines link/text is visible  Failed")
# 		else 
# 			browser.Puts "view_lines check box is  not checked in , for #{prod_usr_name} production lines link/text is not visible Passed"
# 				Assertions.assertequal(true,false,"view_lines check box is  not checked in , for #{prod_usr_name} production lines link/text is not visible Passed")
# 		end
# 	end
# browser.close

# if  create_lines == 'set'
# 	browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')	
		
# 		flag = browser.find_link_by_href('/admin/lines/new').exists? 
# 		if flag == true
# 		browser.Puts " Create Line checkbox is checked in and New Line Button is Displayed  Passed"
# 		Assertions.assertequal(true,true," Create Line checkbox is checked in and New Line Button is Displayed  Passed")
# 			else 
# 			browser.Puts "Create Line checkbox is not checked in and New Line Button isnot Displayed  Failed"
# 			Assertions.assertequal(true,false," Create Line checkbox is checked in and New Line Button is Displayed  Failed")
# 		end
# 	browser.close
# elsif create_lines == 'clear'
# browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')	
		
# 		flag = browser.find_link_by_href('/admin/lines/new').exists? 
# 		if flag == true
# 		browser.Puts "Create Line checkbox is checked in and New Line Button is Displayed Failed"
# 		Assertions.assertequal(true,true," Create Line checkbox is checked in and New Line Button is Displayed  Failed")
# 			else 
# 			browser.Puts "Create Line checkbox is not checked in and New Line Button isnot Displayed  Passed"
# 			Assertions.assertequal(true,false," Create Line checkbox is checked in and New Line Button isnot Displayed  Passed")
# 		end
# 	browser.close
# end
# browser.closer
# if edit_settings == 'set'
#  		if view_lines == 'set'
# 			browser.Puts 'view_lines check box is checked in , further testing for edit_settings for production lines'
# 			browser = Browser.new(url)
# 			browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 			browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 			browser.button_click_name('commit')	
# 			browser.click_link_by_href('/admin/lines')
# 			browser.index_fill_input_text(2,production_lines_id_not_exist)
# 			browser.press_enter
# 			browser.click_link_by_href("/admin/lines/#{production_lines_id}/overview")
# 				sleep 1
# 		 	browser.click_link_by_href("/admin/lines/#{production_lines_id}")
# 			browser.select_item_list_by_name_under_frame_action("/admin/lines/#{production_lines_id}/update_settings","max_skip_limit","2")
# 		  #browser.click_link_by_href("/admin/job_types/#{station_id}/edit") # click on station for editing 
# 		  #browser.click_link_by_text('Content Review 2')
# 		  browser.click_link_by_href("/admin/job_types/#{station_id}/edit")
# 		  sleep 1
# 	    browser.select_item_list_by_name_under_frame_action("/admin/job_types/#{station_id}",'skill_id', prodskill)
# 	    browser.select_item_list_by_name_under_frame_action("/admin/job_types/#{station_id}",'initial_gs_count', init_gs)
# 	    browser.select_item_list_by_name_under_frame_action("/admin/job_types/#{station_id}",'algo_set',algorithm)
# 			if reward == 'set' 
# 					browser.Puts 'you are in here bro'
# 					browser.check_checkbox_on_off('update_station','variable_reward')
# 					#browser.click_text_field_user("/admin/job_types/#{station_id}/edit", '//*[@id="variable_reward"]') # clicks on the reward checkbox
# 					flag = browser.find_text_field_id("/admin/job_types/#{station_id}/edit","min_payout").exists?
# 					if flag
# 						browser.Puts flag
# 						browser.Puts " user #{prod_usr_name} min_payout text field is present Passed "
# 							Assertions.assertequal(true,true," user #{prod_usr_name} min_payout text field is present Passed ")
# 					else 
# 					browser.Puts "user #{prod_usr_name} min_payout text filed is not present Failed "
# 						Assertions.assertequal(true,false,"user #{prod_usr_name} min_payout text filed is not present Failed ")
# 					end
# 			end		
				
# 		else
# 			 	browser.Puts "view_lines check box is not checked in , no further testing for edit_settings for production lines"	
# 			end 
# 		 browser.close
# 	elsif edit_settings == 'clear'
# 		if view_lines == 'set'
# 			browser.Puts 'view_lines check box is checked in , further testing for edit_settings for production lines'
# 			browser = Browser.new(url)
# 			browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 			browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 			browser.button_click_name('commit')	
# 			browser.click_link_by_href('/admin/lines')

# 			browser.index_fill_input_text(2,production_lines_id_not_exist)
# 			browser.press_enter
# 			flag = browser.find_link_by_href("/admin/job_types/#{station_id}/edit").exists? # station id to be entered in CSV
# 				if flag
# 				browser.Puts "edit_settings is clear and #{prod_usr_name} can find settings button Failed"
# 					Assertions.assertequal(true,false,"edit_settings is clear and #{prod_usr_name} can find settings button Failed")
# 				else
# 				browser.Puts "edit_settings is clear and #{prod_usr_name} can find settings button Passed"
# 					Assertions.assertequal(true,true,"edit_settings is clear and #{prod_usr_name} can find settings button Passed")
# 				end
	
# 			else
# 			browser.Puts "view_lines check box is not checked in , no further testing for edit_settings for production lines"	
# 		 	end
# 		 browser.close
# end
# browser.close
# if view_overview == 'set'
# 	if view_lines == 'set'
#  				browser.Puts 'view_lines check box is checked in , further testing for edit_settings for production lines'
#  				browser = Browser.new(url)
# 				browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 				browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 				browser.button_click_name('commit')	
# 				browser.click_link_by_href('/admin/lines')
# 				browser.index_fill_input_text(2,production_lines_id_not_exist)
# 				browser.press_enter
# 				browser.click_link_by_href("/admin/lines/#{production_lines_id}/overview")
# 				titlebrwser =browser.get_browser_title
# 				browser.Puts titlebrwser
# 					if titlebrwser == "Production Lines - Content only 2.0 | CloudFactory"
# 						browser.Puts "view_overview is set and #{prod_usr_name} can click on overview Passed"
# 							Assertions.assertequal(true,true,"view_overview is set and #{prod_usr_name} can click on overview Passed")
# 					else
# 						browser.Puts "view_overview is set and #{prod_usr_name} can click on overview Failed"
# 						Assertions.assertequal(true,false,"view_overview is set and #{prod_usr_name} can click on overview Failed")
# 					end
# 	else
# 		browser.Puts 'view_lines check box is not checked in , no further testing for edit_settings for production lines'
# 		browser.close
# 	end
# browser.close
# elsif view_overview == 'clear'
# 	if view_lines == 'set'
#  				browser.Puts 'view_lines check box is checked in , further testing for edit_settings for production lines'
#  				browser = Browser.new(url)
# 				browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 				browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 				browser.button_click_name('commit')	
# 				browser.click_link_by_href('/admin/lines')
# 				browser.index_fill_input_text(2,production_lines_id_not_exist)
# 				browser.press_enter

# 				flag = browser.find_link_by_href("/admin/lines/#{production_lines_id}/overview").exists? 
# 					if flag
# 						browser.Puts "view_overview is clear and #{prod_usr_name} can click on overview '\e[0;31m'Failed'\e[0m'"
# 							Assertions.assertequal(true,false,"view_overview is clear and #{prod_usr_name} can click on overview '\e[0;31m'Failed'\e[0m'")
# 					else
# 						browser.Puts "view_overview is clear and #{prod_usr_name} can click on overview '\e[0;32m'Passed'\e[0m'"
# 							Assertions.assertequal(true,true,"view_overview is clear and #{prod_usr_name} can click on overview '\e[0;32m'Passed'\e[0m'")
# 					end
# 	else
# 		browser.Puts 'view_lines check box is not checked in , no further testing for edit_settings for production lines'
# 		browser.close
# 	end
# end
# browser.close
# if view_gold_standards == 'set'
# 	if view_lines == 'set'
#  				browser.Puts 'view_lines check box is checked in , further testing for edit_settings for production lines'
#  				browser = Browser.new(url)
# 				browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 				browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 				browser.button_click_name('commit')	
# 				browser.click_link_by_href('/admin/lines')
# 				browser.index_fill_input_text(2,production_lines_id_not_exist)
# 				browser.press_enter

# 				browser.click_link_by_href("/admin/lines/#{production_lines_id}/overview")
# 				browser.click_link_by_class('btn btn-warning dropdown-toggle')
# 				browser.click_link_by_href("/admin/lines/#{production_lines_id}/stations/#{station_id}/gold_standards") #/admin/lines/116/stations/439/gold_standards  production _lines_id  and station id has replaced for 116 and 439
# 				flag = browser.get_browser_title
# 				sleep 1
# 				if flag == "Production Lines - Content only 2.0 | Station - Content only 2.0 | CloudFactory"
# 					browser.Puts "view_gold_standards is set and #{prod_usr_name} is able to navigate to gold standard page Passed"
# 						Assertions.assertequal(true,true,"view_gold_standards is set and #{prod_usr_name} is able to navigate to gold standard page Passed")
# 				else
# 					browser.Puts "view_gold_standards is set and #{prod_usr_name} is not able to navigate to gold standard page Failed"
# 						Assertions.assertequal(true,false,"view_gold_standards is set and #{prod_usr_name} is not able to navigate to gold standard page Failed")
# 				end

# 	else
# 		browser.Puts 'view_lines check box is not checked in , no further testing for edit_settings for production lines'
# 		browser.close
# 	end
# 	browser.close
# elsif view_gold_standards == 'clear'
# 	if view_lines == 'set'
#  				browser.Puts 'view_lines check box is checked in , further testing for edit_settings for production lines'
#  				browser = Browser.new(url)
# 				browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 				browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 				browser.button_click_name('commit')	
# 				browser.click_link_by_href('/admin/lines')
# 				browser.index_fill_input_text(2,production_lines_id_not_exist)
# 				browser.press_enter
# 				browser.click_link_by_href("/admin/lines/#{station_id}/overview")
# 				flag = browser.find_link_by_class('btn btn-warning dropdown-toggle').exists?
# 					if flag 
# 						browser.Puts "view_gold_standards is clear and #{prod_usr_name} is able to navigate to gold standard page Failed"
# 							Assertions.assertequal(true,false, "view_gold_standards is clear and #{prod_usr_name} is able to navigate to gold standard page Failed")
# 					else
# 						browser.Puts "view_gold_standards is clear and #{prod_usr_name} is not able to navigate to gold standard page Passed"
# 							Assertions.assertequal(true,true,"view_gold_standards is clear and #{prod_usr_name} is not able to navigate to gold standard page Passed")
# 					end
# 	end
# end

# browser.close
# if view_production_runs == 'set'
# 	if view_lines == 'set'
#  				browser.Puts 'view_lines check box is checked in , further testing for edit_settings for production lines'
#  				browser = Browser.new(url)
# 				browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 				browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 				browser.button_click_name('commit')	
# 				browser.click_link_by_href('/admin/lines')

# 				browser.index_fill_input_text(2,production_lines_id_not_exist)
# 				browser.press_enter
# 				browser.click_link_by_href("/admin/lines/#{production_lines_id}/overview")
# 				browser.click_link_by_href("/admin/lines/#{production_lines_id}/transactions")
# 			  flag = browser.get_browser_title
# 			  browser.Puts flag
			 
# 				if flag == "Content only 2.0 | Production Runs | CloudFactory" # http://stagingrc.cloudfactory.com/admin/lines/116/transactions
# 					browser.Puts "view_lines is set and #{prod_usr_name} is able to navigate to runs page Passed"
# 						Assertions.assertequal(true,true,"view_lines is set and #{prod_usr_name} is able to navigate to runs page Passed")
# 				else
# 					browser.Puts "view_lines is set and #{prod_usr_name} is not able to navigate to runs page Failed"
# 						Assertions.assertequal(true,false,"view_lines is set and #{prod_usr_name} is not able to navigate to runs page Failed")
# 				end
# 	else
# 		 	browser.Puts 'view_lines check box is not checked in , no further testing for edit_settings for production lines'
# 		 	browser.close
# 	end
# browser.close
# elsif view_production_runs == 'clear'
# 	if view_lines == 'set'
#  				browser.Puts 'view_lines check box is checked in , further testing for edit_settings for production lines'
#  				browser = Browser.new(url)
# 				browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 				browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 				browser.button_click_name('commit')	
# 				browser.click_link_by_href('/admin/lines')
# 				browser.index_fill_input_text(2,production_lines_id_not_exist)
# 				browser.press_enter
# 			  browser.click_link_by_href("/admin/lines/#{production_lines_id}/overview")
# 				browser.click_link_by_href("/admin/lines/#{production_lines_id}/transactions")
# 			  flag = browser.get_browser_title
# 			  browser.Puts flag
			 
# 				if flag == "Content Review 2 | Production Runs | CloudFactory" # http://stagingrc.cloudfactory.com/admin/lines/116/transactions
# 					browser.Puts "view_lines is clear and #{prod_usr_name} is able to navigate to runs page Failed"
# 						Assertions.assertequal(true,false,"view_lines is clear and #{prod_usr_name} is able to navigate to runs page Failed")
# 				else
# 					browser.Puts "view_lines is clear and #{prod_usr_name} is not able to navigate to runs page Passed"
# 						Assertions.assertequal(true,false,"view_lines is clear and #{prod_usr_name} is not able to navigate to runs page Passed")
# 				end
# 	else
# 		 	browser.Puts 'view_lines check box is not checked in , no further testing for edit_settings for production lines'
# 		 	browser.close
# 	end
# end
# browser.close
# if create_production_runs == 'set'
# 	if view_lines == 'set'
#  				browser.Puts 'view_lines check box is checked in , further testing for edit_settings for production lines'
#  				browser = Browser.new(url)
# 				browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 				browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 				browser.button_click_name('commit')	
# 				browser.click_link_by_href('/admin/lines')
# 				browser.index_fill_input_text(2,production_lines_id_not_exist)
# 				browser.press_enter
# 			  browser.click_link_by_href("/admin/lines/#{production_lines_id}/overview")
# 				browser.click_link_by_href("/admin/lines/#{production_lines_id}/transactions")
# 			  flag = browser.get_browser_title
# 			  browser.Puts flag
			 
# 				if flag == "Content only 2.0 | Production Runs | CloudFactory"  # http://stagingrc.cloudfactory.com/admin/lines/116/transactions
# 					browser.Puts "view_lines is set and #{prod_usr_name} is able to navigate to runs page Passed"
# 						Assertions.assertequal(true,false,"view_lines is set and #{prod_usr_name} is able to navigate to runs page Passed")
# 						flag = browser.find_link_by_text('New Run').exists?
# 						if flag 
# 							browser.Puts " create_production_runs check box is checked in and user #{prod_usr_name} is able to view  New Run , Passed"
# 								Assertions.assertequal(true,true," create_production_runs check box is checked in and user #{prod_usr_name} is able to view  New Run , Passed")
# 						else 
# 							browser.Puts " create_production_runs check box is checked in and user #{prod_usr_name} is not able to view  New Run , Failed"
# 								Assertions.assertequal(true,false,"view_lines is set and #{prod_usr_name} is not able to navigate to runs page Failed")
# 						end	
# 				else
# 					browser.Puts "view_lines is set and #{prod_usr_name} is not able to navigate to runs page Failed"
# 						Assertions.assertequal(true,false,"view_lines is set and #{prod_usr_name} is not able to navigate to runs page Failed")
# 				end
# 	else
# 		 	browser.Puts 'view_lines check box is not checked in , no further testing for edit_settings for production lines'
		 	
# 	end
# browser.close
# elsif create_production_runs == 'clear'
# 		if view_lines == 'set'
#  				browser.Puts 'view_lines check box is checked in , further testing for edit_settings for production lines'
#  				browser = Browser.new(url)
# 				browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 				browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 				browser.button_click_name('commit')	
# 				browser.click_link_by_href('/admin/lines')
# 				browser.index_fill_input_text(2,production_lines_id_not_exist)
# 				browser.press_enter
# 			  browser.click_link_by_href("/admin/lines/#{production_lines_id}/overview")
# 				browser.click_link_by_href("/admin/lines/#{production_lines_id}/transactions")
# 			  flag = browser.get_browser_title

# 			if flag == "Content only 2.0 | Production Runs | CloudFactory" # http://stagingrc.cloudfactory.com/admin/lines/116/transactions
# 						browser.Puts "view_lines is set and #{prod_usr_name} is able to navigate to runs page Passed"
# 							Assertions.assertequal(true,true,"view_lines is set and #{prod_usr_name} is able to navigate to runs page Passed")
# 							flag = browser.find_link_by_text('New Run').exists?
# 							if flag 
# 								browser.Puts " create_production_runs check box is not checked in and user #{prod_usr_name} is able to view  New Run , Failed"
# 						Assertions.assertequal(true,false,"view_lines is set and #{prod_usr_name} is able to navigate to runs page failed")

# 							else 
# 								browser.Puts " create_production_runs check box is not checked in and user #{prod_usr_name} is not able to view  New Run , Passed"
# 						Assertions.assertequal(true,true," create_production_runs check box is not checked in and user #{prod_usr_name} is not able to view  New Run , Passed")

# 							end
# 					else
# 						browser.Puts "view_lines is set and #{prod_usr_name} is not able to navigate to runs page Failed"
# 						Assertions.assertequal(true,false,"view_lines is set and #{prod_usr_name} is not able to navigate to runs page Failed")

# 					end
# 	 			else
# 		 			browser.Puts 'view_lines check box is not checked in , no further testing for edit_settings for production lines'
		 			
# 				end
# end	
# browser.close
#  if view_production_run_details == 'set'
# 	if view_lines == 'set'
#  				browser.Puts 'view_lines check box is checked in , further testing for edit_settings for production lines'
#  				browser = Browser.new(url)
# 				browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 				browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 				browser.button_click_name('commit')	
# 				browser.click_link_by_href('/admin/lines')
# 				browser.index_fill_input_text(2,production_lines_id_not_exist)
# 				browser.press_enter
# 			  browser.click_link_by_href("/admin/lines/#{production_lines_id}/overview")
# 				browser.click_link_by_href("/admin/lines/#{production_lines_id}/transactions")
# 			  browser.click_text_field_id('transaction_date_filter')# clicks on the date 
#  		    browser.button_click_text('Clear')
#  		    browser.click_link_by_href("/admin/lines/129/transactions?date=&view_type=completed")
# 				browser.click_link_by_text('1201')
#  		    browser.windows_use_last
#  		    browser.div_click(0,'header header_tmp')
#  		    browser.Puts "View production run details Passed "
#  		     		Assertions.assertequal(true,true,"View production run details Passed ")

#  		else
# 		 	browser.Puts 'view_lines check box is not checked in , no further testing for edit_settings for production lines'
# 		 	browser.close
# 		end
# 		browser.close
# 	elsif view_production_run_details == 'clear'
# 		if view_lines == 'set'
#  				browser.Puts 'view_lines check box is checked in , further testing for edit_settings for production lines'
#  				browser = Browser.new(url)
# 				browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 				browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 				browser.button_click_name('commit')	
# 				browser.click_link_by_href('/admin/lines')

# 				browser.index_fill_input_text(2,production_lines_id_not_exist)
# 				browser.press_enter

# 			  browser.click_link_by_href("/admin/lines/#{production_lines_id}/overview")
# 				browser.click_link_by_href("/admin/lines/#{production_lines_id}/transactions")
# 			  browser.click_text_field_id('transaction_date_filter')# clicks on the date 
#  		    browser.button_click_text('Clear')

#  		    browser.click_link_by_xpath('//*[@id="tt_table"]/tbody/tr[1]/td[1]/a')
#  		    browser.windows_use_last
#  		    browser.div_click('header header_tmp')

#  		    browser.click_link_by_xpath('/html/body/section/div[2]/div/div[3]/div[2]/div/div[2]/a[1]') #Clicks on 1st Job
#  		    browser.click_link_by_xpath('/html/body/section/div[2]/div/div[2]/div[1]/a') #Clicks on DataSource's In Progress
#  		    flag = browser.get_text_H4('page-content')
#  		    if flag == /Status: /
#  		    	browser.Puts "view_production_run_details text box is not checked and #{prod_usr_name}  is able to navigate on this page Failed "
#  		    	 		    	Assertions.assertequal(true,false,"view_production_run_details text box is not checked and #{prod_usr_name}  is able to navigate on this page Failed ")

#  		    else
#  		    	browser.Puts "view_production_run_details text box is not checked and #{prod_usr_name}  is not able to navigate on this page Passed"
#  		    	 		    			Assertions.assertequal(true,true,"view_production_run_details text box is not checked and #{prod_usr_name}  is not able to navigate on this page Passed")

#  		    end
#  		else
# 		 	browser.Puts 'view_lines check box is not checked in , no further testing for edit_settings for production lines'
		
# 		end
# 	end
#  	browser.close
# if delete_lines == 'set'
# 	if view_lines == 'set'
# 			browser.Puts 'view_lines check box is checked in , further testing for edit_settings for production lines'
# 			browser = Browser.new(url)
# 			browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 			browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 			browser.button_click_name('commit')	
# 			browser.click_link_by_href('/admin/lines')
# 			browser.index_fill_input_text(2,production_lines_id_not_exist)
# 			browser.press_enter
# 	  	browser.click_link_by_href("/admin/lines/#{production_lines_id}/overview")
# 			browser.click_link_by_href("/admin/lines/#{production_lines_id}/transactions")
# 	  	browser.click_text_field_id('transaction_date_filter')# clicks on the date 
# 	    browser.button_click_text('Clear')
	  
# 	    browser.click_link_by_href('/admin/transactions/FNxolvHYDF/jobs') #here we need a DS which is in progress
# 	    browser.windows_use_last
# 	    browser.div_click(0,'header header_tmp')
# 	    flag = browser.find_by_a('Abort').exists?
# 				if flag
# 			    browser.Puts "delete_lines text box is  checked and #{prod_usr_name}  is able find abort button on this page Passed "
# 			    			    		Assertions.assertequal(true,true,"delete_lines text box is  checked and #{prod_usr_name}  is able find abort button on this page Passed ")
# 			  else
# 			  	browser.Puts "delete_lines text box is  checked and #{prod_usr_name}  is not able find abort button on this page Failed "
# 			  				  	Assertions.assertequal(true,false,"delete_lines text box is  checked and #{prod_usr_name}  is not able find abort button on this page Failed ")

# 			  end
#  	else
# 		 	browser.Puts 'view_lines check box is not checked in , no further testing for edit_settings for production lines'
# 		 	browser.close
# 	end
# 	browser.close
# elsif  delete_lines == 'clear'
# 	if view_lines == 'set'
# 		browser.Puts 'view_lines check box is checked in , further testing for edit_settings for production lines'
# 		browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')	

# 		browser.click_link_by_href('/admin/lines')

# 		browser.index_fill_input_text(2,production_lines_id_not_exist)
# 		browser.press_enter
# 		browser.click_link_by_href("/admin/lines/#{production_lines_id}/overview")
# 		browser.click_link_by_href("/admin/lines/#{production_lines_id}/transactions")
# 		browser.click_text_field_id('transaction_date_filter')# clicks on the date 
# 	  browser.button_click_text('Clear')
	 
# 		browser.click_link_by_href('/admin/transactions/FNxolvHYDF/jobs')
# 		browser.windows_use_last
# 		browser.div_click(0,'header header_tmp')
# 		flag = browser.find_by_a('Abort').exists?  
# 		if flag
# 			browser.Puts "delete_lines text box is  not checked and #{prod_usr_name}  is able find abort button on this page Failed "
# 		Assertions.assertequal(true,false,"delete_lines text box is  not checked and #{prod_usr_name}  is able find abort button on this page Failed ")
# 		else
# 			browser.Puts "delete_lines text box is not checked and #{prod_usr_name}  is not able find abort button on this page Passed "
# 		Assertions.assertequal(true,true,"delete_lines text box is not checked and #{prod_usr_name}  is not able find abort button on this page Passed ")

# 		end
# 	else 
# 		 	browser.Puts 'view_lines check box is not checked in , no further testing for edit_settings for production lines'
		 
# 	end
# end	
# 	browser.close
# if view_production_run_results == 'set'
# 	if view_lines == 'set'
# 		browser.Puts 'view_lines check box is checked in , further testing for edit_settings for production lines'
# 		browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')	
# 		browser.click_link_by_href('/admin/lines')
# 		browser.index_fill_input_text(2,production_lines_id_not_exist)
# 		browser.press_enter
# 		browser.click_link_by_href("/admin/lines/#{production_lines_id}/overview")
# 		browser.click_link_by_href("/admin/lines/#{production_lines_id}/transactions")
# 	  browser.click_text_field_id('transaction_date_filter')# clicks on the date 
#     browser.button_click_text('Clear')
#     browser.click_link_by_href('/admin/transactions/jsz61N7Ozs/jobs')
#     browser.windows_use_last
#     browser.div_click(0,'header header_tmp')
#     flag = browser.find_by_a('Download CSV').exists?
#   	if flag
#   		browser.Puts "view_production_run_results text box is  checked and #{prod_usr_name}  is able find Download CSV button on this page Passed"
#   		Assertions.assertequal(true,true,"view_production_run_results text box is  checked and #{prod_usr_name}  is able find Download CSV button on this page '\e[0;31m'Passed'\e[0m'")
#   	else
#   		browser.Puts "view_production_run_results text box is  checked and #{prod_usr_name}  is not able find Download CSV button on this page Failed "
#   	Assertions.assertequal(true,false,"view_production_run_results text box is  checked and #{prod_usr_name}  is not able find Download CSV button on this page Failed ")
#   	end
# 	else
# 		 	browser.Puts 'view_lines check box is not checked in , no further testing for edit_settings for production lines'
		 	
# 	end
# 	browser.close
# elsif  view_production_run_results == 'clear'
# 	if view_lines == 'set'
# 		browser.Puts 'view_lines check box is checked in , further testing for edit_settings for production lines'
# 		browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')	
# 		browser.click_link_by_href('/admin/lines')
# 		browser.index_fill_input_text(2,production_lines_id_not_exist)
# 		browser.press_enter
# 	  browser.click_link_by_href("/admin/lines/#{production_lines_id}/overview")
# 		browser.click_link_by_href("/admin/lines/#{production_lines_id}/transactions")
# 	  browser.click_text_field_id('transaction_date_filter')# clicks on the date 
#     browser.button_click_text('Clear')
#     browser.click_link_by_href("/admin/lines/129/transactions?date=&view_type=completed")
# 		browser.click_link_by_text('1201')
#  		browser.windows_use_last
#     browser.div_click(0,'header header_tmp')
#     flag = browser.find_by_a('Download CSV').exists?
#   	if flag
#   		browser.Puts "view_production_run_results text box is  not checked and #{prod_usr_name}  is able find Download CSV button on this page Failed "
#   	Assertions.assertequal(true,false,"view_production_run_results text box is  not checked and #{prod_usr_name}  is able find Download CSV button on this page Failed ")
#   	else
#   		browser.Puts "view_production_run_results text box is not checked and #{prod_usr_name}  is not able find Download CSV button on this page Passed "
#   	Assertions.assertequal(true,true,"view_production_run_results text box is not checked and #{prod_usr_name}  is not able find Download CSV button on this page Passed ")
#   	end
#  	else
# 		 	browser.Puts 'view_lines check box is not checked in , no further testing for edit_settings for production lines'
			
# 	end
# end	
# browser.close
# if create_gold_standards == 'set'
# 	if view_lines == 'set'
#  				browser.Puts 'view_lines check box is checked in , further testing for edit_settings for production lines'
#  				browser = Browser.new(url)
# 				browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 				browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 				browser.button_click_name('commit')	
# 				browser.click_link_by_href('/admin/lines')
# 				browser.index_fill_input_text(2,production_lines_id_not_exist)
# 				browser.press_enter
# 				browser.click_link_by_href("/admin/lines/#{production_lines_id}/overview")
# 	 			browser.click_link_by_href("/admin/lines/#{production_lines_id}/transactions")
# 	 			browser.click_text_field_id('transaction_date_filter')# clicks on the date 
#  		    browser.button_click_text('Clear')
#  		    browser.click_link_by_href("/admin/lines/129/transactions?date=&view_type=completed")
#  		    browser.click_link_by_text('1201')
#  		    browser.windows_use_last
#  		    browser.div_click(0,'header header_tmp')
#  		    #browser.click_link_by_xpath('/html/body/section/div[2]/div/div[3]/div[2]/div/div[2]/a[1]') #Clicks on 1st Job
#  		    browser.click_link_by_class('btn small')
#  		    browser.div_click(1,'btn-group')
#  		    browser.click_link_by_text('Make GS')
#  		    browser.fancy_box_close('fancybox-close')
#  		    browser.Puts "create_gold_standards text box is   checked and #{prod_usr_name}  is able to make GS via JT on this page Passed"
#  		    Assertions.assertequal(true,true,"create_gold_standards text box is   checked and #{prod_usr_name}  is able to make GS via JT on this page '\e[0;31m'Passed'\e[0m'")
#  		    # Make GS via Wizard TBD
# 	else
# 	 		browser.Puts 'Production line is not visible hence to test Manage_Data_Sources_Assigned please make production_line line visible  and retry, '	
# 	end
# browser.close
# elsif create_gold_standards == 'clear'
# 	if view_lines == 'set'
#  				browser.Puts 'view_lines check box is checked in , further testing for edit_settings for production lines'
#  				browser = Browser.new(url)
# 				browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 				browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 				browser.button_click_name('commit')	
# 				browser.click_link_by_href('/admin/lines')

# 				browser.index_fill_input_text(2,production_lines_id_not_exist)
# 				browser.press_enter
# 			  browser.click_link_by_a('transactions')
# 			  browser.click_text_field_id('transaction_date_filter')# clicks on the date 
#  		    browser.button_click_text('Clear')
#  		    browser.click_value_table(0,0)
#  		    browser.windows_use_last
#  		    browser.div_click('header header_tmp')
# 				# Make GS via DS
# 				browser.click_value_table(0,3) # clicks on Datasource link . 

# 				flag = browser.get_text_H1('page-content')
#  		    if flag == /Data Sources for Production Run 1189 /
#  		    	browser.Puts "create_gold_standards text box is  not checked and #{prod_usr_name}  is able to make GS Via DS  Failed "
#  		    Assertions.assertequal(true,false,"create_gold_standards text box is  not checked and #{prod_usr_name}  is able to make GS Via DS  Failed ")
#  		    else
#  		    browser.Puts "create_gold_standards text box is not checked and #{prod_usr_name}  is not able to navigate on this page Passed"
#  				Assertions.assertequal(true,true,"create_gold_standards text box is not checked and #{prod_usr_name}  is not able to navigate on this page Passed")

#  		    	browser.close
#  		    end

#  		    browser.click_link_by_text('Production Runs')
#  		    browser.click_text_field_id('transaction_date_filter')# clicks on the date 
#  		    browser.button_click_text('Clear')
#  		    browser.click_li_text('completed')
#  		    browser.click_text_link_on_table
#  		    browser.windows_use_last
#  		    browser.div_click('header header_tmp')
#  		    browser.click_link_by_xpath('/html/body/section/div[2]/div/div[3]/div[2]/div/div[2]/a[1]') #Clicks on 1st Job
#  		    browser.div_click('btn-group')
#  		    browser.click_link_by_text('Make GS')
#  		    browser.fancy_box_close('fancybox-close')
#  		    browser.Puts "create_gold_standards text box is not checked and #{prod_usr_name}  is able to make GS via JT on this page Failed"
#  		 		Assertions.assertequal(true,false,"create_gold_standards text box is not checked and #{prod_usr_name}  is able to make GS via JT on this page Failed")

# 	else
# 	 		browser.Puts 'Production line is not visible hence to test Manage_Data_Sources_Assigned please make production_line line visible  and retry, from  create_gold_standards'	
# 	end
	
# end
# browser.close
# # # Access non assigned lines with combination of view lines only 
# if access_non_assigned == 'set'
# 	if view_lines == 'set'
# 		browser.Puts 'view_lines check box is checked in , further testing for edit_settings for production lines'
# 		browser = Browser.new(url)
# 		browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 		browser.button_click_name('commit')	
# 		browser.click_link_by_href('/admin/lines')
# 		browser.fill_input_text_by_class('span2', production_lines_id_not_exist)
# 		browser.press_enter
# 		flag = browser.validating_empty_table('dataTables_empty')
# 			if flag !='No data available in table'
# 				browser.Puts "access_non_assigned text box is checked and #{prod_usr_name}  is  not able to view lines that aren't assigned Failed"
# 		Assertions.assertequal(true,false,"access_non_assigned text box is checked and #{prod_usr_name}  is  not able to view lines that aren't assigned Failed")
# 			else
# 				browser.Puts "access_non_assigned text box is checked and #{prod_usr_name}  is  able to view lines that aren't assigned Passed"
# 		Assertions.assertequal(true,true,"access_non_assigned text box is checked and #{prod_usr_name}  is  able to view lines that aren't assigned Passed")

# 			end
# 	else
# 	 		browser.Puts 'Production line is not visible hence to test Manage_Data_Sources_Assigned please make production_line line visible  and retry hello ......, '	
# 	end
# browser.close
# elsif access_non_assigned == 'clear'
# 	if view_lines == 'set'
#  			browser.Puts 'view_lines check box is checked in , further testing for edit_settings for production lines'
#  			browser = Browser.new(url)
# 			browser.fill_input_text_by_name('user[email]', prod_usr_name )
# 			browser.fill_input_text_by_name('user[password]', prod_usr_pass)
# 			browser.button_click_name('commit')	
# 			browser.click_link_by_href('/admin/lines')
# 			browser.fill_input_text_by_class('span2', production_lines_id_not_exist)
# 			browser.press_enter
# 			sleep 1
# 			flag = browser.validating_empty_table('dataTables_empty')
# 			browser.Puts flag
# 			if flag == 'No matching records found'
# 				browser.Puts "access_non_assigned text box is not checked and #{prod_usr_name}  is not able to view lines that aren't assigned Passed"
# 			Assertions.assertequal(true,true,"access_non_assigned text box is not checked and #{prod_usr_name}  is not able to view lines that aren't assigned Passed")
# 			else
# 				browser.Puts "access_non_assigned text box is not checked and #{prod_usr_name}  is  able to view lines that aren't assigned Failed"
# 				Assertions.assertequal(true,false,"access_non_assigned text box is not checked and #{prod_usr_name}  is not able to view lines that aren't assigned Failed")
# 			end
# 	else
# 	 		browser.Puts 'Production line is not visible hence to test Manage_Data_Sources_Assigned please make production_line line visible  and retry, access_non_assigned'	
# 	end

# 	browser.close

# end