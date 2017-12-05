# This test script would review the workflow by two users, both the reviewer would AGREE so that it would complete in one cycle.
#username_cf is the first reviewer while username_worker is the second reviewer
#prerequisites : UserName  automation.107@cloudfactory.com, automation.106@cloudfactory.com,production lines 133 should be present.
Dir[File.join(File.expand_path('../../', __FILE__),'Data/*.rb')].each {|file| require (file)}

#########################Fetching Data########################

#env_setting = Util.data_from_datafile['testing_for_review_census_person'] 
env_setting1 = Util.read_data_from_file("content_review")
env_setting= env_setting1['testing_for_review_census_person']
###          ####             ####                 ####
url_admin = env_setting['url_admin']
url = env_setting['url_worker']
username_admin = env_setting['username_admin']
password_admin = env_setting['password_admin']
production_lines_id = env_setting['production_lines_id']
username_cf = env_setting['username_cf']
password_cf = env_setting['password_cf']
username_worker = env_setting['username_worker']
password_worker = env_setting['password_worker']
year = env_setting['year']
month = env_setting['month']


browser = Browser.new(url_admin)
browser.fill_input_text_by_name('user[email]', username_admin )
browser.fill_input_text_by_name('user[password]', password_admin)
browser.button_click_name('commit')	
browser.click_link_by_href('/admin/lines')
browser.index_fill_input_text(2,production_lines_id_not_exist)
browser.press_enter
browser.click_link_by_href("/admin/lines/#{production_lines_id}/overview")
browser.click_link_by_href("/admin/lines/#{production_lines_id}/transactions")
browser.click_text_field_id('transaction_date_filter')# clicks on the date 
browser.button_click_text('Clear')
sleep 1

progress = browser.extracting_value_from_tab('in_progress')
initial_count1 = progress.to_i

completed= browser.extracting_value_from_tab('completed')
initial_count2 = completed.to_i
browser.close

#first reviewer
browser = Browser.new(url)
browser.fill_input_text_by_name('worker[email]', username_cf )
browser.fill_input_text_by_name('worker[password]', password_cf)
browser.button_click_name('commit')

if browser.find_span_class('icon-remove remove_notification').exists?
	browser.click_span_class('icon-remove remove_notification')
end

####Calculating the worker's amount before doing tasks############

browser.click_ul_class
browser.click_link_by_text('Account')
amount = browser.getValue_span_class('formatted_money').delete("$")
toint1 = amount.to_f
browser.click_link_by_text('Workspace')
taskexist = browser.find_button_frame_name('work_frame', "Submit (Press Enter)").exists?
if taskexist
	flag = browser.find_image_src('work_frame','http://cfaccusoft.s3.amazonaws.com/full/2314ac82-47a3-4d34-9d22-9b0e0ed1970e_Age1.jpg').exists?
		while flag 
			puts "Got Gold standard and will work on Gold Standard "
			sleep 1
			browser.button_click_frame_name('work_frame', "Submit (Press Enter)")
			puts "Worked on gold standard , Passed"
			sleep 10
			flag = browser.find_image_src('work_frame','http://cfaccusoft.s3.amazonaws.com/full/2314ac82-47a3-4d34-9d22-9b0e0ed1970e_Age1.jpg').exists?
		end
else 
	puts "no tasks"
end

sleep 1
flag = browser.find_button_frame_name('work_frame', "Submit (Press Enter)").exists?
if flag
	puts "Got Regular Task for Reviewer 1"
	browser.button_click_frame_name('work_frame', "Submit (Press Enter)")
	sleep 1
	browser.click_ul_class
	browser.click_link_by_text('Account')
	amount1 = browser.getValue_span_class('formatted_money').delete("$")
	#amoun = browser.del_unwanted_chars(amount)
	toint2 = amount1.to_f

sleep 1
browser.click_ul_class
browser.click_link_by_text('Log out')
else
puts "'\e[0;31m' Task Not loaded  for #{username_cf}'\e[0m'"
sleep 1
browser.click_ul_class
browser.click_link_by_text('Log out')
end
sleep 1
Assertions.assert_increment(toint1,toint2,true)
########Another reviewer
sleep 1
browser.fill_input_text_by_name('worker[email]', username_worker )
browser.fill_input_text_by_name('worker[password]', password_worker)
browser.button_click_name('commit')
sleep 2
if browser.find_span_class('icon-remove remove_notification').exists?
	browser.click_span_class('icon-remove remove_notification')
end
####Calculating the worker's amount before doing tasks############
sleep 5
browser.click_ul_class
browser.click_link_by_text('Account')
amount2 = browser.getValue_span_class('formatted_money').delete("$")
toint1 = amount2.to_f
puts toint1
browser.click_link_by_text('Workspace')
sleep 3
taskexist = browser.find_button_frame_name('work_frame', "Submit (Press Enter)").exists?
if taskexist
flag = browser.find_image_src('work_frame','http://cfaccusoft.s3.amazonaws.com/full/2314ac82-47a3-4d34-9d22-9b0e0ed1970e_Age1.jpg').exists?
while flag 
puts "Got Gold standard and will work on Gold Standard "
sleep 1
browser.button_click_frame_name('work_frame', "Submit (Press Enter)")
sleep 1
#browser.button_click_frame_name('work_frame', "Submit (Press Enter)")
puts "Worked on gold standard , Passed"
sleep 10
flag = browser.find_image_src('work_frame','http://cfaccusoft.s3.amazonaws.com/full/2314ac82-47a3-4d34-9d22-9b0e0ed1970e_Age1.jpg').exists?
sleep 3
end
else
	puts "no tasks"
end
sleep 3
flag = browser.find_button_frame_name('work_frame', "Submit (Press Enter)").exists?
if flag
	puts "Got Regular Tasks for reviewer 2"
sleep 3
browser.button_click_frame_name('work_frame', "Submit (Press Enter)")
sleep 4
#####Calulating the worker's amout after doing tasks#####
browser.click_ul_class
browser.click_link_by_text('Account')
amount3 = browser.getValue_span_class('formatted_money').delete("$")
toint2 = amount3.to_f
sleep 3
browser.click_ul_class
browser.click_link_by_text('Log out')
else
	puts "'\e[0;31m' Task Not loaded  for #{username_worker}'\e[0m'"
browser.click_ul_class
browser.click_link_by_text('Log out')
sleep 1
Assertions.assert_increment(toint1,toint2,true)
end
browser.close
#cp checking status
browser = Browser.new(url_admin)
browser.fill_input_text_by_name('user[email]', username_admin )
browser.fill_input_text_by_name('user[password]', password_admin)
browser.button_click_name('commit')	
browser.click_link_by_href('/admin/lines')
browser.index_fill_input_text(2,production_lines_id_not_exist)
browser.press_enter
browser.click_link_by_href("/admin/lines/#{production_lines_id}/overview")
browser.click_link_by_href("/admin/lines/#{production_lines_id}/transactions")
browser.click_text_field_id('transaction_date_filter')# clicks on the date 
browser.button_click_text('Clear')
sleep 5
progress2 = browser.extracting_value_from_tab('in_progress')
final_count1 = progress2.to_f
completed2 = browser.extracting_value_from_tab('completed')
final_count2 =completed2.to_f
#when in_progress gets decreased and completed gets increase a task is  complete.
sleep 3
Assertions.assert_increment(initial_count1,final_count1,false) # input take false as in_progress tab needs to be decreases as it completes the task.
sleep 3
Assertions.assert_increment(initial_count2,final_count2,true)
browser.close
####Calulating the worker's amount after doing tasks#####

