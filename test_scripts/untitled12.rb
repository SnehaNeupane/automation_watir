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
		browser = Browser.new(url)
		browser.fill_input_text_by_name('user[email]', prod_usr_name )
		browser.fill_input_text_by_name('user[password]', prod_usr_pass)
		browser.button_click_name('commit')
		browser.click_link_by_href('/admin/accounts')
			# browser.fill_input_text_by_class('span2', account_not_exist) # account_not_exist should be the one where the username_cf does not belong to this account 
			browser.fill_input_text_by_class_index(2,'form-control', account_not_exist)
			browser.press_enter
			browser.click_link_by_text(account_not_exist)
			browser.fill_input_text_by_class_index(5,'form-control', account_not_exist)

					#browser.index_fill_input_text(3, prod_usr_name) # Searching your own user name in 1st account to verify the assigned account is displayed
					browser.press_enter