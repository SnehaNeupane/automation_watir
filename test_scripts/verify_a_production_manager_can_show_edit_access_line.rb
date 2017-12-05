# Description   : Verifying Production Manager can view workers
# Pre-requisites:  
# Date: February 25 2014
####################################################################
Dir[File.join(File.expand_path('../../', __FILE__),'Data/*.rb')].each {|file| require (file)}
env_setting = Util.data_from_datafile['user_assign_role']
url = env_setting['url_admin']
username_admin = env_setting['username_admin']
password_admin = env_setting['password_admin']
username = env_setting['username_cf']
browser = Browser.new(url)
browser.fill_input_text_by_name('user[email]', username_admin )
browser.fill_input_text_by_name('user[password]', password_admin)
browser.button_click_name('commit')
browser.click_link_by_href('/admin/lines')
if browser.click_link_by_href('/admin/lines').exists?
	puts "Prod manager could see lines details"
else 
	puts "Prod manager could not see line details"
end 

browser.close