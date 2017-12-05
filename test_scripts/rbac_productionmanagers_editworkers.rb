Dir[File.join(File.expand_path('../../', __FILE__),'Data/*.rb')].each {|file| require (file)}
# #########################Fetching Data########################

env_setting1= Util.read_data_from_file('DataforRbac')
env_setting= env_setting1['assigning_and_retracting_roles_by_production_managers']
url = CONFIG['cp_url']
username_admin = CONFIG['cp_user_id']
password_admin = CONFIG['cp_password']
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
## selecting and de-selecting checkbox
browser = Browser.new(url)
#browser.browser.Puts "I am here "
browser.fill_input_text_by_name('user[email]', username_admin )
browser.fill_input_text_by_name('user[password]', password_admin)
browser.button_click_name('commit')
browser.click_link_by_href('/admin/roles')

#### selecting and de-selecting checkbox
browser.checkbox_action(3,'56',view_users)
browser.checkbox_action(3,'57',create_users)# Needs more detailed information regarding this . will sscript later . 
browser.checkbox_action(3,'58',edit_users)# Needs more detail3d infomation regarding this . will script later . 
browser.checkbox_action(3,'59',delete_users)
browser.checkbox_action(3,'61',view_accounts_all)
browser.checkbox_action(3,'62',view_accounts_assigned)
browser.checkbox_action(3,'63',create_accounts)
browser.checkbox_action(3,'64',edit_accounts_all)
browser.checkbox_action(3,'65',edit_accounts_assigned)
browser.checkbox_action(3,'66',delete_accounts_all)
browser.checkbox_action(3,'67',delete_accounts_assigned)
browser.checkbox_action(3,'68',associate_users_all)
browser.checkbox_action(3,'69',associate_users_assigned)
browser.checkbox_action(3,'71',manage_roles_and_permissions)
browser.checkbox_action(3,'73',view_workers)
browser.checkbox_action(3,'74',edit_workers)
browser.checkbox_action(3,'75',assign_edit_worker_skills)
browser.checkbox_action(3,'77',view_skills)
browser.checkbox_action(3,'78',create_new_skills)
browser.checkbox_action(3,'79',edit_skills)
browser.checkbox_action(3,'80',upload_workers_or_modify_skills_in_mass)
browser.checkbox_action(3,'82',access_non_assigned)
browser.checkbox_action(3,'83',view_lines)
browser.checkbox_action(3,'84',create_lines)
browser.checkbox_action(3,'85',edit_settings)
browser.checkbox_action(3,'86',delete_lines)
browser.checkbox_action(3,'87',view_overview)
browser.checkbox_action(3,'88',view_gold_standards)
browser.checkbox_action(3,'89',create_gold_standards)
browser.checkbox_action(3,'90',view_production_runs)
browser.checkbox_action(3,'91',create_production_runs)
browser.checkbox_action(3,'92',delete_production_runs)
browser.checkbox_action(3,'93',view_production_run_details)
browser.checkbox_action(3,'94',view_production_run_results)
browser.checkbox_action(3,'96',view_reports_all)
browser.checkbox_action(3,'97',view_reports_assigned)

browser.click_text_field_user('/admin/roles/edit_permissions','/html/body/div[3]/aside[2]/section[2]/section/div/div/form/div[2]/div/input')

browser.click_link_by_text('admin@cloudfactory.com')
browser.click_link_by_text('Logout')

browser.close
if edit_workers == 'set'
	if view_workers == 'clear'
		browser.Puts "view_workers check box is not checked in  , hence the Worker link is not visible , "
		browser.Puts " To test Edit worker view_workers check box  needs to be checked in , please retry"		
	else
		browser = Browser.new(url)
			browser.Puts browser.get_browser_title
			browser.fill_input_text_by_name('user[email]', prod_usr_name )
			browser.fill_input_text_by_name('user[password]', prod_usr_pass)
			browser.button_click_name('commit')	
			browser.click_link_by_href('/admin/workers')
			flag = browser.find_link_by_href('/admin/workers/new').exists? # finds the existence of create worker button
				if flag 
				browser.Puts "Edit worker check box is checked in and worker can view Create worker button Passed"
				Assertions.assertequal(true,true,"Edit worker check box is checked in and worker can view Create worker button Passed")
				else
				browser.Puts "Edit worker check box is checked in and create worker button is not visible Failed"
				Assertions.assertequal(true,false,"Edit worker check box is checked in and create worker button is not visible Failed")
				
				end
				browser.click_link_by_href('/admin/workers/new')

				browser.Puts "User #{prod_usr_name} is able to click on Create Worker Passed"
					Assertions.assertequal(true,true,"User #{prod_usr_name} is able to click on Create Worker Passed")
				browser.click_link_by_href('/admin/workers')
				browser.fill_input_text_by_class('span2',worker_id) # enters desire user id in the text box
		   	browser.press_enter
	  
	   	 	browser.click_link_by_href('/admin/workers/2336/edit')
				browser.Puts "User #{prod_usr_name} is able to click on Edit Worker Passed"
				Assertions.assertequal(true,true,"User #{prod_usr_name} is able to click on Edit Worker Passed")

				browser.click_link_by_href('/admin/workers')
				browser.fill_input_text_by_class('span2',worker_id) # enters desire user id in the text box
		   	browser.press_enter
		  
			browser.click_link_by_text(worker_id)
			
	end 	
			browser.find_link_by_text('Disable')			
			browser.Puts "User #{prod_usr_name} is able disable the worker"
			browser.js_popup	
	browser.close
elsif edit_workers == 'clear'
	if view_workers == 'clear'
			browser.Puts "view_workers check box is not checked in  , hence the Worker link is not visible , "
			browser.Puts " To test Edit worker view_workers check box  needs to be checked in , please retry"
			browser.close
	else
			browser = Browser.new(url)
				browser.Puts browser.get_browser_title
				browser.fill_input_text_by_name('user[email]', prod_usr_name )
				browser.fill_input_text_by_name('user[password]', prod_usr_pass)
				browser.button_click_name('commit')	

			browser.click_link_by_href('/admin/workers')

			flag = browser.find_link_by_href('/admin/workers/new').exists? # finds the existence of create worker button
				if flag 
					browser.Puts "Edit worker check box is not checked in and worker can view Create worker button Failed"
					Assertions.assertequal(true,false,"Edit worker check box is not checked in and worker can view Create worker button Failed")
				else
					browser.Puts "Edit worker check box is not checked in and create worker button is not visible Passed"
					Assertions.assertequal(true,true,"Edit worker check box is not checked in and create worker button is not visible Passed")
				end
				 flag = browser.find_link_by_href('/admin/workers/62/edit').exists?
				 if flag 
					 browser.Puts "User #{prod_usr_name} is able to find on Edit Worker Failed"
					 Assertions.assertequal(true,false,"User #{prod_usr_name} is able to find on Edit Worker Failed")
				 else
					 browser.Puts "User #{prod_usr_name} is not able to find on Edit Worker Passed"	
					 Assertions.assertequal(true,true,"User #{prod_usr_name} is not able to find on Edit Worker Passed"	)
				 			end
			 	browser.click_link_by_href('/admin/workers')
				browser.fill_input_text_by_class('span2',worker_id) # enters desire user id in the text box
		   	browser.press_enter
		   	sleep 1
		   	flag = browser.find_link_by_text(worker_id).exists?
		   	if flag
		   		browser.click_link_by_text(worker_id)
		   		browser.Puts "User #{prod_usr_name} is able to click on the worker link and View Passed"
		   		Assertions.assertequal(true,true,"User #{prod_usr_name} is able to click on the worker link and View Passed")
		   	else
		   		browser.Puts "User #{prod_usr_name} is unable to click on the worker link and View Failed"
		   		Assertions.assertequal(true,false,"User #{prod_usr_name} is unable to click on the worker link and View Failed")
		   	end
		sleep 1
		   	flag = browser.find_link_by_xpath('/html/body/section/div[2]/div/div[1]/div[2]/div/a').exists? #for disable button TRUE AND FALSE 
		   	sleep 1
				if flag == true
					browser.Puts "User #{prod_usr_name} is not able to find disable the worker button Failed"
					Assertions.assertequal(true,false,"User #{prod_usr_name} is not able to find disable the worker button Failed")
				else
					browser.Puts "User #{prod_usr_name} is not able to find disable the worker button Passed"
					Assertions.assertequal(true,true,"User #{prod_usr_name} is not able to find disable the worker button Passed")
				end
		browser.close
	 		
	end
	end	 