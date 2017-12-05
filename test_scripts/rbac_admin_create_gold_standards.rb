Dir[File.join(File.expand_path('../../', __FILE__),'Data/*.rb')].each {|file| require (file)}
# #########################Fetching Data########################

env_setting1= Util.read_data_from_file('DataforRbac')
env_setting= env_setting1['assigning_and_retracting_roles_by_admin']
#url = env_setting['url_admin']
url = CONFIG['cp_url']
username_admin = CONFIG['cp_user_id']
password_admin = CONFIG['cp_password']
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
browser.checkbox_action(3,'80',upload_workers_or_modify_skills_in_mass)
browser.checkbox_action(3,'82',access_non_assigned)
browser.checkbox_action(3,'83',view_lines)
browser.checkbox_action(3,'84',create_lines)
browser.checkbox_action(3,'85',edit_settings)
browser.checkbox_action(3,'86',delete_lines)
browser.checkbox_action(3,'87',view_overview)
browser.checkbox_action(3,'88',view_gold_standards)
browser.click_text_field_user('/admin/roles/edit_permissions','/html/body/div[3]/aside[2]/section[2]/section/div/div/form/div[2]/div/input')
browser.click_link_by_text('admin@cloudfactory.com')
browser.click_link_by_text('Logout')
browser.close
if create_gold_standards == 'set'
	if view_lines == 'set'
 				#browser.Puts 'view_lines check box is checked in , further testing for edit_settings for production lines'
 				browser = Browser.new(url)
				browser.fill_input_text_by_name('user[email]', prod_usr_name )
				browser.fill_input_text_by_name('user[password]', prod_usr_pass)
				browser.button_click_name('commit')	
				browser.click_link_by_href('/admin/lines')
				browser.index_fill_input_text(2,production_lines_id)
				browser.press_enter
				browser.click_link_by_href("/admin/lines/#{production_lines_id}/overview")
	 			browser.click_link_by_href("/admin/lines/#{production_lines_id}/transactions")
	 			browser.click_text_field_id('transaction_date_filter')# clicks on the date 
 		    browser.button_click_text('Clear')
 		    browser.click_link_by_href("/admin/lines/129/transactions?date=&view_type=completed")
 		    browser.click_link_by_text('1201')
 		    browser.windows_use_last
 		    browser.div_click(0,'header header_tmp')
				sleep 2
				browser.click_link_by_xpath('/html/body/div[3]/aside[2]/section[2]/section/div/div[2]/div[3]/div[1]/div[2]/div/div[2]/a') #Clicks on 1st Job
#/html/body/div[3]/aside[2]/section[2]/section/div/div[2]/div[3]/div[1]/div[2]/div/div[2]/a
sleep 2
 		    browser.div_click(2,'btn-group')
 		    browser.click_link_by_text('Make GS')
 		    browser.fancy_box_close('fancybox-close')
 		    browser.Puts "create_gold_standards text box is   checked and #{prod_usr_name}  is able to make GS via JT on this page Passed"
 		    Assertions.assertequal(true,true,"create_gold_standards text box is   checked and #{prod_usr_name}  is able to make GS via JT on this page Passed" )
	else
	 		browser.Puts 'Production line is not visible hence to test Manage_Data_Sources_Assigned please make production_line line visible  and retry, '	
	end
browser.close
elsif create_gold_standards == 'clear'
	if view_lines == 'set'
 				browser.Puts 'view_lines check box is checked in , further testing for edit_settings for production lines'
 				browser = Browser.new(url)
				browser.fill_input_text_by_name('user[email]', prod_usr_name )
				browser.fill_input_text_by_name('user[password]', prod_usr_pass)
				browser.button_click_name('commit')	
				browser.click_link_by_href('/admin/lines')
				browser.index_fill_input_text(2,production_lines_id)
				browser.press_enter
			  browser.click_link_by_a('transactions')
			  browser.click_text_field_id('transaction_date_filter')# clicks on the date 
 		    browser.button_click_text('Clear')
			  browser.click_value_table(0,0)
 		    browser.windows_use_last
 		    browser.div_click('header header_tmp')
				# Make GS via DS
	
				browser.click_value_table(0,3) # clicks on Datasource link . 
				flag = browser.get_text_H1('page-content')
 		    if flag == /Data Sources for Production Run 1189 /
 		    	browser.Puts "create_gold_standards text box is  not checked and #{prod_usr_name}  is able to make GS Via DS  Failed "
 		    	Assertions.assertequal(true,false,"create_gold_standards text box is  not checked and #{prod_usr_name}  is able to make GS Via DS  Failed ")
 		    else
 		    	browser.Puts "create_gold_standards text box is not checked and #{prod_usr_name}  is not able to navigate on this page Passed"
 		    	Assertions.assertequal(true,true,"create_gold_standards text box is not checked and #{prod_usr_name}  is not able to navigate on this page Passed" )
 		    	browser.close
 		    end
 		    browser.click_link_by_text('Production Runs')
 		    browser.click_text_field_id('transaction_date_filter')# clicks on the date 
 		    browser.button_click_text('Clear')
 		    browser.click_li_text('completed')
 		    browser.click_text_link_on_table
 		    browser.windows_use_last
 		    browser.div_click('header header_tmp')
 		    browser.click_link_by_xpath('/html/body/section/div[2]/div/div[3]/div[2]/div/div[2]/a[1]') #Clicks on 1st Job
 		    binding.pry
 		    browser.div_click('btn-group')
 		    browser.click_link_by_text('Make GS')
 		    browser.fancy_box_close('fancybox-close')
 		    browser.Puts "create_gold_standards text box is not checked and #{prod_usr_name}  is able to make GS via JT on this page Failed"
 		     	Assertions.assertequal(true,false, "create_gold_standards text box is not checked and #{prod_usr_name}  is able to make GS via JT on this page Failed")
 		    # Make GS via Wizard TBD
	else
	 		browser.Puts 'Production line is not visible hence to test Manage_Data_Sources_Assigned please make production_line line visible  and retry, from  create_gold_standards'	
	end
	browser.close
end
