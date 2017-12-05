# Description   : user is required to 
# Pre-requisites: A new skills needs to be added to the worker, Please run setting _up_new_skills.rb and follow pre-requisite , verify worker is not disabled
# Date: February 18 2018
#############################################################################################################

require '../lib/browser'
require '../Utilities/util'
require 'pry'
env_setting = Util.data_from_datafile['verifying_score_skill_after_work_goldstandard']
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
browser = Browser.new(url)
browser.fill_input_text_by_name('developer_session[email]', username)
browser.fill_input_text_by_name('developer_session[password]', password )
browser.button_click_name('commit')
sleep(3)
browser.click_link_by_text('Admin')
#browser.click_link_by_href('/admin' )
#browser = Browser.new('cloudfactory.qa')  #commented as it might not be needed
browser.fill_input_text_by_name('user[email]', username_admin )
browser.fill_input_text_by_name('user[password]', password_admin)
browser.button_click_name('commit')
browser.click_link_by_text('Workers')

browser.fill_input_text_by_class('span2', worker_id )
# Press Enter 
browser.press_enter
browser.click_link_by_text(worker_id)

browser.click_link_by_text('History')
puts "waiting 5 seconds to fetch the text"
browser.wait_till_load(5)
	#sleep(5)
score = browser.get_value_table(1,2)
ds1 = score.to_f
puts  "fetching initial score"

browser.click_link_by_text('admin@cloudfactory.com')
browser.click_link_by_text('Logout')
browser.close
browser = Browser.new(url_worker)
browser.fill_input_text_by_name('worker[email]', username_worker)
browser.fill_input_text_by_name('worker[password]', password_worker)
browser.button_click_name('commit')
browser.click_link_by_href('/workers' )
browser.fill_input_text_by_name('query', worker_email)
browser.press_enter
browser.click_link_by_href('/workers/'+worker_id)
amount = browser.getValue_span_class('formatted_money')
toint1 = amount.to_f
puts toint1
browser.click_link_by_href('/workers/'+worker_id)
browser.click_link_by_href('/workers/'+worker_id+'/masquerades/start')
browser.click_link_by_text('Workspace')
browser.input_text_field_frame_name('work_frame', 'output[year]', 1)
browser.input_text_field_frame_name('work_frame', 'output[month]', 1)
browser.input_text_field_frame_name('work_frame', 'output[last_name]', '-')
browser.input_text_field_frame_name('work_frame', 'output[given_name]', 1)
browser.button_click_frame_name('work_frame', "Submit (Press Enter)")
sleep 3
browser.wait_till_load(5)
#browser.click_link_by_text("Workers")
browser.click_link_by_href('/workers' )
#browser.click_link_by_text('Teams')
browser.fill_input_text_by_name('query', worker_email)
browser.press_enter
browser.click_link_by_text(worker_name)

dAmount = browser.getValue_span_class('formatted_money')
toint2 = dAmount.to_f
puts dAmount

browser.close
browser = Browser.new(url)
browser.fill_input_text_by_name('developer_session[email]', username)
browser.fill_input_text_by_name('developer_session[password]', password )
browser.button_click_name('commit')
browser.click_link_by_text('Admin')
browser.fill_input_text_by_name('user[email]', username_admin )
browser.fill_input_text_by_name('user[password]', password_admin )
browser.button_click_name('commit')
browser.click_link_by_text('Workers')
browser.fill_input_text_by_class('span2', worker_id)
browser.press_enter

	browser.click_link_by_text(worker_id)
	browser.click_link_by_text('History')
	puts "waiting 5 seconds to fetch the text"
	browser.wait_till_load(5)
	score1 = browser.get_value_table(1,2)
	ds2 = score1.to_f

	puts (score)+ " Grabbing  final score" 
	puts "change in the score #{ds2-ds1}"
	puts "Amount is changed by #{toint2 - toint1}"
browser.click_link_by_text('admin@cloudfactory.com')
browser.click_link_by_text('Logout')
browser.close