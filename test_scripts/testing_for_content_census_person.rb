#purpose : To test the entering content
#pre-requisite: there should be task in the system . Name of task file is "1 input_4pars_GS" 
					# => this file is in Data folder . Task would come from the content review automation. 
				

Dir[File.join(File.expand_path('../../', __FILE__),'Data/*.rb')].each {|file| require (file)}
url = CONFIG['wp_url']
env_setting1 = Util.read_data_from_file('content_review')
env_setting= env_setting1['testing_for_content_census_person']
username_cf = env_setting['username_cf']
password_cf = env_setting['password_cf']
year = env_setting['year']
month = env_setting['month']
last_name = env_setting['last_name']
given_name = env_setting['given_name']
#########################Fetching Data########################

browser = Browser.new(url)
browser.fill_input_text_by_name('worker[email]', username_cf)
browser.fill_input_text_by_name('worker[password]', password_cf)
browser.button_click_name('commit')
sleep 3
if browser.find_span_class('icon-remove remove_notification').exists?
	browser.click_span_class('icon-remove remove_notification')
end
sleep 3
####Calculating the worker's amount before doing tasks############
browser.click_ul_class
browser.click_ul_class
sleep 1
browser.click_link_by_text('Account')

amount = browser.getValue_span_class('formatted_money').delete("$")
toint1 = amount.to_f
puts toint1
##########################Doing content task#################
browser.click_link_by_text('Workspace')
taskexist = browser.find_button_frame_name('work_frame', "Submit (Press Enter)").exists?
if taskexist
flag = browser.find_image_src('work_frame','http://cfaccusoft.s3.amazonaws.com/full/2314ac82-47a3-4d34-9d22-9b0e0ed1970e_Age1.jpg').exists?
while flag

#browser.Puts "Got Gold standard and will work on Gold Standard "
puts "Got Gold standard and will work on Gold Standard "
browser.input_text_field_frame_name('work_frame', 'output[year]', year)
browser.input_text_field_frame_name('work_frame', 'output[month]', month)
browser.button_click_frame_name('work_frame', "Submit (Press Enter)")
puts "Worked on gold standard , Passed"
sleep 5
flag = browser.find_image_src('work_frame','http://cfaccusoft.s3.amazonaws.com/full/2314ac82-47a3-4d34-9d22-9b0e0ed1970e_Age1.jpg').exists?
end
else
puts "no task loaded"
end
if browser.find_text_field_frame_name('work_frame', 'output[year]').exists?
puts  "Got Regular tasks and will work on it  "
browser.input_text_field_frame_name('work_frame', 'output[year]', year)
browser.input_text_field_frame_name('work_frame', 'output[month]', month)
browser.button_click_frame_name('work_frame', "Submit (Press Enter)")
puts "Worked on Regular Tasks Passed"
else 
	#browser.Puts("Puts","no task loaded")
	puts "no task loaded"
end

#####Calulating the worker's amout after doing tasks#####

sleep 1
browser.click_ul_class
browser.click_ul_class
browser.click_link_by_text('Account')
amount = browser.getValue_span_class('formatted_money').delete("$")

toint2 = amount.to_f

sleep 2
Assertions.assert_increment(toint1,toint2,true) # we expected after working on the task it should increase the amount hence last argument is true , Anyother scenario is false . 

sleep 5
browser.click_ul_class
browser.click_link_by_text('Log out')

sleep 100

browser.close

## this flow should work on at leat one task other than gold standa4d . . 


