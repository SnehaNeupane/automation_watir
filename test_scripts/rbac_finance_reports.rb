Dir[File.join(File.expand_path('../../', __FILE__),'Data/*.rb')].each {|file| require (file)}
# #########################Fetching Data########################

env_setting1= Util.read_data_from_file('DataforRbac')
env_setting= env_setting1['assigning_and_retracting_roles_by_finance']
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

view_reports_all = env_setting['view_reports_all']
view_reports_assigned = env_setting['view_reports_assigned']
## selecting and de-selecting checkbox
browser = Browser.new(url)
browser.fill_input_text_by_name('user[email]', username_admin )
browser.fill_input_text_by_name('user[password]', password_admin)
browser.button_click_name('commit')
browser.click_link_by_href('/admin/roles')
browser.checkbox_action(3,'96',view_reports_all)
browser.checkbox_action(3,'97',view_reports_assigned)
browser.click_text_field_user('/admin/roles/edit_permissions','/html/body/div[3]/aside[2]/section[2]/section/div/div/form/div[2]/div/input')
 browser.click_link_by_text('admin@cloudfactory.com')
 browser.click_link_by_text('Logout')
browser.close

if view_reports_all == 'set'
		browser = Browser.new(url)
			browser.fill_input_text_by_name('user[email]', prod_usr_name )
			browser.fill_input_text_by_name('user[password]', prod_usr_pass)
			browser.button_click_name('commit')	
			flag = browser.find_link_by_href('/admin/reports').exists?
				if flag
					browser.Puts "view_reports_all check box is checked and reports is seen Passed"
					Assertions.assertequal(true,true,"view_reports_all check box is checked and reports is seen Passed")
					sleep 1
					browser.click_link_by_href('/admin/reports')
					browser.button_click_class('btn dropdown-toggle selectpicker btn-default')
					browser.fill_input_text_by_class('input-block-level form-control', 'All')# should be in the data file . a proper one 
					browser.press_enter
					browser.Puts "User #{prod_usr_name} is able to click  Accounts drop down  and select the option from the list "
					browser.click_span_text('Select Line') # clicks on select line drop down .
					browser.Puts "User #{prod_usr_name} is able to click  Select Line drop down."
					browser.click_text_field_id('report_date_filter')
					browser.button_click_text('Submit')
					browser.Puts "User #{prod_usr_name} is able to click  on the Date."
			else
				browser.Puts "view_reports_all check box is checked and reports is not seen Failed"
				Assertions.assertequal(true,false,"view_reports_all check box is checked and reports is not seen Failed")
			end
		browser.close

elsif view_reports_all == 'clear'
		browser = Browser.new(url)
			browser.fill_input_text_by_name('user[email]', prod_usr_name )
			browser.fill_input_text_by_name('user[password]', prod_usr_pass)
			browser.button_click_name('commit')	
			flag = browser.find_link_by_href('/admin/lines/227/overview').exists?
			if flag 
				browser.Puts "view_reports_all check box is not checked in , Reports button is displayed Failed"
				Assertions.assertequal(true,false,"view_reports_all check box is not checked in , Reports button is displayed Failed")
			else
			browser.Puts "view_reports_all check box is not checked in , Reports button is not displayed , Passed "
			Assertions.assertequal(true,true,"view_reports_all check box is not checked in , Reports button is not displayed , Passed ")
			end
		browser.close
end