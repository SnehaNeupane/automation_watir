# Description   : Verifying a a new skilled user gets correct number of initial gold standards --
# 							  and also verifies a user gets a regular task after initial gold standard .
# Pre-requisites: A new skills needs to be added , Please run setting _up_new_skills.rb and follow pre-requisite
# Date: February 18 2018
#############################################################################################################

Dir[File.join(File.expand_path('../../', __FILE__),'Data/*.rb')].each {|file| require (file)}
env_setting = Util.data_from_datafile['new_skill_gets_7gs']
url = env_setting['url_cf']
username = env_setting['username_cf']
password = env_setting['password_cf']
url_worker = env_setting['url_worker']
username_worker = env_setting['username_worker']
password_worker = env_setting['password_worker']
username_admin = env_setting['username_admin']
password_admin = env_setting['password_admin']
worker_id = env_setting['worker_id']
worker_name = env_setting['workername']
worker_email = env_setting['worker_email']
skill = env_setting['skill']
init_gs = env_setting['initial_gs']

browser = Browser.new(url)
browser.click_link_by_text('Admin')
browser.fill_input_text_by_name('user[email]', username_admin )
browser.fill_input_text_by_name('user[password]', password_admin)
browser.button_click_name('commit')

browser.wait_till_load(10)

browser.click_link_by_href('/admin/lines')


browser.click_link_by_href('/admin/lines/249/overview')
browser.click_link_by_href('/admin/lines/249')
browser.select_item_list_by_id('skill_id', skill)
browser.select_item_list_by_id('initial_gs_count', init_gs)

browser.close

browser = Browser.new(url_worker)
browser.fill_input_text_by_name('worker[email]', username_worker)
browser.fill_input_text_by_name('worker[password]', password_worker)
browser.button_click_name('commit')
browser.click_link_by_href('/workers' )
browser.fill_input_text_by_name('query', worker_email)
browser.press_enter

browser.click_link_by_href('/workers/'<<worker_id)

browser.click_link_by_href('/workers/'<<worker_id<<'/masquerades/start')
browser.click_link_by_text('Workspace')
puts "I am here "
gs_counter = 1
while gs_counter <= init_gs.to_i
browser.input_text_field_frame_name('work_frame', 'output[year]', 1)
browser.input_text_field_frame_name('work_frame', 'output[month]', 1)
browser.input_text_field_frame_name('work_frame', 'output[last_name]', '-')
browser.input_text_field_frame_name('work_frame', 'output[given_name]', 1)
browser.button_click_frame_name('work_frame', "Submit (Press Enter)")

gs_counter = gs_counter + 1
if gs_counter ==  init_gs.to_i
	Break
 end


sleep 1
end
 if gs_counter = init_gs.to_i
 	puts "initial Gold Standard has reached "<< gs_counter
 	 
end 


browser.input_text_field_frame_name('work_frame', 'output[year]', 1)
browser.input_text_field_frame_name('work_frame', 'output[month]', 1)
browser.input_text_field_frame_name('work_frame', 'output[last_name]', '-')
browser.input_text_field_frame_name('work_frame', 'output[given_name]', 1)
browser.button_click_frame_name('work_frame', "Submit (Press Enter)")
browser.text_exists("Please enter valid year_input .")
puts "this is not a gold standard"


browser.input_text_field_frame_name('work_frame', 'output[year]', 34)
browser.input_text_field_frame_name('work_frame', 'output[month]', )
browser.input_text_field_frame_name('work_frame', 'output[last_name]', '-')
browser.input_text_field_frame_name('work_frame', 'output[given_name]', 'PEARL')
browser.button_click_frame_name('work_frame', "Submit (Press Enter)")

puts "this is a regular task" unless browser.text_exists("Please enter valid year_input .")


browser.close
