#Purpose : Purpose of this test script is to validate line creation with Wizard
#Prerequisite : none

Dir[File.join(File.expand_path('../../', __FILE__),'Data/*.rb')].each {|file| require (file)}

env_setting1 = Util.read_data_from_file('line')
env_setting= env_setting1['testing_New_Line_useformbuilder_content_review']
url = CONFIG['cp_url']
username = CONFIG['cp_user_id']
pass = CONFIG['cp_password']

line_name = env_setting['line_name']
account = env_setting['account']
skill = env_setting['skill']
init_gs = env_setting['init_gs']
algorithm = env_setting['algo']

browser = Browser.new(url)
	browser.fill_input_text_by_name('user[email]', username )
	browser.fill_input_text_by_name('user[password]', pass)
	browser.button_click_name('commit')	
	browser.click_link_by_href('/admin/lines')
	browser.click_link_by_href('/admin/lines/new')
	browser.click_li_form_title('/admin/lines','new_template')

	browser.click_li_form_index('/admin/lines',0)
	browser.fill_text_field_by_xpath('//*[@id="name"]',line_name)
	browser.button_click_index(0)
	browser.click_by_a('Build form with form builder')
	sleep 1
	browser.test_div_find('#cl-title > div:nth-child(1)').click# title
  browser.test_div_find('#cl-title > div:nth-child(2)').click#instructions
	browser.test_div_find('#cl-data-source > div:nth-child(1)').click #image
	browser.test_div_find('#cl-data-source > div:nth-child(3)').click #link
	browser.test_div_find('#cl-data-source > div:nth-child(4)').click #web page
 	browser.test_div_find('#cl-data-source > div:nth-child(5)').click #audio
	browser.test_div_find('#cl-task > div:nth-child(1)').click # Text input
 	browser.test_div_find('#cl-task > div:nth-child(2)').click #TEst area
	browser.test_div_find('#cl-task > div:nth-child(3)').click #checkbox
 	browser.test_div_find('#cl-task > div:nth-child(4)').click #Multiple choice
	browser.test_div_find('#cl-task > div:nth-child(5)').click #List
	browser.click_link_by_text('Finish')

   if line_name ==  browser.get_value_table_withindexandid(0,1)
   	Assertions.assertequal(true,true, "Line Creation SuccessFul")
   	browser.Puts "Line Creation SuccessFul"
   else
   		Assertions.assertequal(true,false, "Line Creation unSuccessFul")
   		browser.Puts "Line Creation unSuccessFul"
   	end
   	station_id1 =	browser.get_table_data_index(1,0,0)[0..-11]
   	station_id = station_id1.split.join("\n").delete('\n')
		sleep 1
   	browser.hover_table_withindexandid(1,0,1)
   	browser.click_link_by_href("/work_sources/test_editor?id=#{station_id}")
   	browser.windows_use_last
 
   sleep 2
		if browser.get_browser_title  == "http://cloudfactory.di/work_sources/test_editor?id=#{station_id}"
				browser.Puts "New line created exists in View interface, please check content manually"
				Assertions.assertequal(true,true, "view interface successful , opens in new window/tab")
				browser.Puts "New line created exists ,please check content manually"
		else
				Assertions.assertequal(true,false, "view interface unsuccessful ")
				browser.Puts "New line created doesnot exists in view interface , please check "
		end
browser.windows_use_last.close
browser.click_link_by_href("/admin/job_types/#{station_id}/edit")
browser.select_item_list_by_name_under_frame_action("/admin/job_types/#{station_id}",'initial_gs_count',init_gs)
sleep 1
browser.select_item_list_by_name_under_frame_action("/admin/job_types/#{station_id}",'skill_id',skill)
sleep 1
browser.select_item_list_by_name_under_frame_action("/admin/job_types/#{station_id}",'algo_set',algorithm)
sleep 1
browser.click_text_field_user("/admin/job_types/#{station_id}",'//*[@id="tab2"]/form/fieldset/div[2]/input')

browser.click_link_by_xpath('/html/body/section/div[2]/div/div[2]/div/a[1]')
sleep 1
browser.click_link_by_href('/admin/lines')
browser.fill_input_text_by_class('span2', line_name)
browser.press_enter
sleep 2
a = browser.get_table_data_index(0,1,1)

b = a.split("\n")[0]

if b == line_name 
	Assertions.assertequal(true,true, "Line Thus created visible in the production line After approved")
	browser.Puts "Line Thus created is visible in the production line after approved"
else 
	Assertions.assertequal(true,false, "Line Thus created is not visible in the production line After approved")
	browser.Puts "Line Thus created is not visible in the production line after approved"
end 
browser.close



	







