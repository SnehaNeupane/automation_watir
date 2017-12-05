# Description   : Verifying Production Managers has following views : Dashboard, Accounts,
# 							: Skills , Workers, Assembly Lines , Production Runds, Reports
# Pre-requisites:  
# Date: February 24 2014
#########################################

require '../lib/browser'
require '../Utilities/util'

env_setting = Util.data_from_datafile['user_assign_role']
url = env_setting['url_admin']
username_admin = env_setting['username_admin']
password_admin = env_setting['password_admin']
username = env_setting['username_cf']
browser = Browser.new(url)
browser.fill_input_text_by_name('user[email]', username_admin )
browser.fill_input_text_by_name('user[password]', password_admin)
browser.button_click_name('commit')
browser.wait_till_load(10)
if browser.click_text_field('Create').
	if browser.find_link_by_href('/admin')exists?
		if browser.find_link_by_href('/admin/accounts').exists?
			if browser.find_link_by_href('/admin/roles').exists?
			if browser.find_link_by_href("/admin/skills").exists?
				if browser.find_link_by_href('/admin/workers').exists?
					if browser.find_link_by_href('/admin/lines').exists?
						if browser.find_link_by_href('/admin/transactions').exists?
							if browser.find_link_by_href('/admin/reports').exists?

								puts " Production manager"
							elsif 
								puts " Production Manager has extra or less views please check . Test Case Failed "
							end
						end
						end
					end
				end
			end
		end
