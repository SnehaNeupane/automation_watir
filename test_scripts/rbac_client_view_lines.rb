Dir[File.join(File.expand_path('../../', __FILE__),'Data/*.rb')].each {|file| require (file)}
# #########################Fetching Data########################

env_setting1= Util.read_data_from_file('DataforRbac')
env_setting= env_setting1['assigning_and_retracting_roles_by_data_client']
url = env_setting['url_admin']
prod_usr_name = env_setting['prod_usr_name']
prod_usr_pass = env_setting['prod_usr_pass']	
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


if  view_lines == 'set'
		browser = Browser.new(url)
		browser.fill_input_text_by_name('user[email]', prod_usr_name )
		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
		browser.button_click_name('commit')	
		flag = browser.find_link_by_href('/admin/lines').exists? # check the existence of production lines  link on the screen 
		if flag
			browser.Puts "view_lines check box is checked in , production lines link/text is visible  Passed"
			Assertions.assertequal(true,true,"view_lines check box is checked in , production lines link/text is visible  Passed")
		else 
			browser.Puts "view_lines  check box is  checked in , production lines link/text is not visible Failed"
			Assertions.assertequal(true,false,"view_lines  check box is  checked in , production lines link/text is not visible Failed")
		end
		browser.close

elsif view_lines == 'clear'
		browser = Browser.new(url)
		browser.fill_input_text_by_name('user[email]', prod_usr_name )
		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
		browser.button_click_name('commit')	
		flag = browser.find_link_by_href('/admin/lines').exists? # check the existence of production lines  link on the screen 
		if flag
			browser.Puts "view_lines check box is not checked in , for #{prod_usr_name} production lines link/text is visible  Failed"
			Assertions.assertequal(true,false,"view_lines check box is not checked in , for #{prod_usr_name} production lines link/text is visible  Failed")
		else 
			browser.Puts "view_lines check box is  not checked in , for #{prod_usr_name} production lines link/text is not visible Passed "
			Assertions.assertequal(true,true,"view_lines check box is  not checked in , for #{prod_usr_name} production lines link/text is not visible Passed ")
		end
	end
browser.close