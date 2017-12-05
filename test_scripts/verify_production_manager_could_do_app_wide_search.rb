# Description   : Verifying production manager could view reports
# Pre-requisites:  
# Date: February 25 2014
#########################################

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
browser.fill_input_text_by_name('q',':worker' <<worker_id)
brower.press_enter
browser.click_link_by_text(worker_id)
if 
	browser.find_link_by_text('Skills').exists?
	puts 'prod manager is able to do worker search and view worker details'
end

browser.fill_input_text_by_name('q',':transaction' <<transaction_id)
brower.press_enter
puts 'prod manager is able to do transaction search '
browser.fill_input_text_by_name('q',':developer' <<developer_id)
brower.press_enter
puts 'prod manager is able to do developer search'
browser.close

