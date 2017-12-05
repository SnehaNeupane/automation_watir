#Purpose: Verifying 
Dir[File.join(File.expand_path('../../', __FILE__),'Data/*.rb')].each {|file| require (file)}
#########################Fetching Data########################
env_setting1= Util.read_data_from_file('alpha')
env_setting= env_setting1['alpha_prior_slow_validation']
url = env_setting['url_admin']
url_admin_wp = env_setting['url_admin_wp']
prod_usr_name = env_setting['prod_usr_name']
prod_usr_pass = env_setting['prod_usr_pass']	
prodskill = env_setting['prodskill']

init_gs = env_setting['init_gs']
algorithm = env_setting['algorithm']
worker_id = env_setting['worker_id']
production_lines_id = env_setting['production_lines']
transaction_id = env_setting['transaction_id']
developer_id = env_setting['developer_id']
station_id = env_setting['station_id']
worker_email = env_setting['worker_email']

username_cf = env_setting['username_cf']
password_cf = env_setting['password_cf']

year = env_setting['year']
month = env_setting['month']
skill_value = env_setting['skill_value']
#############Setting Page###################################
browser = Browser.new(url)
			browser.fill_input_text_by_name('user[email]', prod_usr_name )
			browser.fill_input_text_by_name('user[password]', prod_usr_pass)
			browser.button_click_name('commit')	
			browser.click_link_by_href('/admin/lines')
			browser.index_fill_input_text(2,production_lines_id_not_exist)
			browser.press_enter
			browser.click_link_by_href("/admin/lines/#{production_lines_id}/overview")
				sleep 1
		 	browser.click_link_by_href("/admin/lines/#{production_lines_id}")
			#browser.select_item_list_by_name_under_frame_action("/admin/lines/#{production_lines_id}/update_settings","max_skip_limit","2")
		  #browser.click_link_by_href("/admin/job_types/#{station_id}/edit") # click on station for editing 
		  #browser.click_link_by_text('Content Review 2')
		  browser.click_link_by_href("/admin/job_types/#{station_id}/edit")
		  sleep 1
	  
	    browser.select_item_list_by_name_under_frame_action("/admin/job_types/#{station_id}",'algo_set',algorithm)
	    browser.click_text_field_user("/admin/job_types/#{station_id}",'//*[@id="tab2"]/form/fieldset/div[2]/input')
	    sleep 3

#####################CP Initial Skill Score###################

browser.click_link_by_text('Workers')
browser.fill_input_text_by_class('span2', worker_id)
browser.press_enter
sleep 5

browser.click_link_by_href("/admin/workers/3218")
browser.fill_input_text_by_class('span2',prodskill)
browser.press_enter
sleep 5

browser.fill_input_text_by_class('value',skill_value)
browser.press_enter
sleep 3

browser.close

#########################Fetching Data########################

browser = Browser.new(url_admin_wp)	

browser.fill_input_text_by_name('worker[email]', username_cf)
browser.fill_input_text_by_name('worker[password]', password_cf)

browser.button_click_name('commit')

sleep 3

if browser.find_span_class('icon-remove remove_notification').exists?
	browser.click_span_class('icon-remove remove_notification')
end
sleep 3

browser.click_link_by_text('Workspace')

##########################Doing content task#################
flag = browser.find_image_src('work_frame','http://cfaccusoft.s3.amazonaws.com/full/2314ac82-47a3-4d34-9d22-9b0e0ed1970e_Age1.jpg').exists?
if flag
#browser.Puts "Got Gold standard and will work on Gold Standard "
puts "Got Gold standard and will work on Gold Standard "
 browser.input_text_field_frame_name('work_frame', 'output[year]', year)
 browser.input_text_field_frame_name('work_frame', 'output[month]', month)
browser.button_click_frame_name('work_frame', "Submit (Press Enter)")
puts "Worked on gold standard , Passed"
sleep 5
else
	browser.Puts "expected Task not loaded"
end
browser.click_ul_class
browser.click_link_by_text('Log out')
browser.close
##################CP Skill Score after doing tasks####################
browser = Browser.new(url)
browser.fill_input_text_by_name('user[email]', prod_usr_name )
browser.fill_input_text_by_name('user[password]', prod_usr_pass)
browser.button_click_name('commit')	

browser.click_link_by_href('/admin/workers')
browser.fill_input_text_by_class('span2', worker_id)
browser.press_enter
sleep 5

browser.click_link_by_href("/admin/workers/3218")
browser.fill_input_text_by_class('span2',prodskill)
browser.press_enter
sleep 5

value = browser.get_input_text_by_class(3)
value_converted = value.to_f

diff = value_converted - skill_value.to_f 

diff = diff.round(3)
if diff == 0.012
	browser.Puts "Passed: algorithm works fine for alpha prior "

else
	browser.Puts "Failed: algorithm doesn't works fine for alpha prior"
end

browser.close


######Case 2 for wrong ############

