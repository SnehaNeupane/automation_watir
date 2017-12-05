# Description   : Verifying a new skilled user gets correct number of initial gold standards he enters wrong  inputs in all 7 Goldstandards
#. Verify he gets a real tasks or a Gold standard after 7 gold standard has been submitted.
# Pre-requisites: A new skills needs to be added , Please run setting _up_new_skills.rb and follow pre-requisite
# Date: February 19 2018
#############################################################################################################


Dir[File.join(File.expand_path('../../', __FILE__),'Data/*.rb')].each {|file| require (file)}

env_setting = Util.data_from_datafile['new_skill_right_input_gold_standard']
username = env_setting['username_cf']
password = env_setting['password_cf']
url_worker = env_setting['url_worker']
username_worker = env_setting['username_worker']
password_worker = env_setting['password_worker']
initial_gs = env_setting['initial_gs']
password_admin = env_setting['password_admin']
worker_id = env_setting['worker_id']
worker_name = env_setting['workername']
worker_email = env_setting['worker_email']

browser = Browser.new(url_worker)
browser.fill_input_text_by_name('worker[email]', username_worker)
browser.fill_input_text_by_name('worker[password]', password_worker)
browser.button_click_name('commit')
browser.click_link_by_href('/workers' )
browser.fill_input_text_by_name('query', worker_email)
browser.press_enter

browser.click_link_by_href('/workers/'+worker_id)
browser.click_link_by_href('/workers/'+worker_id+'/masquerades/start')
browser.click_link_by_text('Workspace')

init = initial_gs.to_i
(1..init).each do |count|

	browser.input_text_field_frame_name('work_frame', 'output[year]', 1)
	browser.input_text_field_frame_name('work_frame', 'output[month]', 1)
	browser.input_text_field_frame_name('work_frame', 'output[last_name]', "-")
	browser.input_text_field_frame_name('work_frame', 'output[given_name]', "1")
	browser.button_click_frame_name('work_frame', "Submit (Press Enter)")
	sleep 2

#	if flag
	# 	browser.button_click_text('Continue to work')
	# else
	# 	puts "Real Tasks"
	# 	break
	# end
	 puts "#{count} gs has been submitted."
end

browser.input_text_field_frame_name('work_frame', 'output[year]', 23)
browser.input_text_field_frame_name('work_frame', 'output[month]', 2)
browser.input_text_field_frame_name('work_frame', 'output[last_name]', "akdjf")
browser.input_text_field_frame_name('work_frame', 'output[given_name]', "kajsdhfn")
browser.button_click_frame_name('work_frame', "Submit (Press Enter)")
sleep 2
flag = browser.find_button_by_text('Continue to work').exists?

if flag
	puts "I still got gold standard. Test Case Failed. "
else
	puts "I got real task. Test case Passed."
end

browser.close