#Description: Validating Gold standard creation with happy path thru AddGS Button

#Date:April 28 2014
#Prerequisites: file is in Automation folder . For this file please use "census 100 No".
require 'rubygems'
require '../lib/browser'
require '../Utilities/util'
require 'nokogiri'
require "watir-webdriver/extensions/alerts"
require 'pry'
#env_setting = Util.data_from_datafile['testing_for_review_census_person'] 
env_setting1 = Util.read_data_from_file("GoldStandard")
env_setting= env_setting1['verifying_the_creation_of_gold_standard']
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
year1 = env_setting['year1']
month1 = env_setting['month1']
 # abpath =env_setting['abpath']
station_id =env_setting['station_id']

browser = Browser.new(url_admin)
browser.fill_input_text_by_name('user[email]', username_admin )
browser.fill_input_text_by_name('user[password]', password_admin)
browser.button_click_name('commit')	
browser.click_link_by_href('/admin/lines')
browser.fill_input_text_by_class('span2',production_lines_id)
browser.press_enter
browser.click_link_by_href("/admin/lines/#{production_lines_id}/overview")
browser.click_link_by_class("btn btn-warning dropdown-toggle")
browser.click_link_by_href("/admin/lines/#{production_lines_id}/stations/#{station_id}/gold_standards")
# 
# count the rows 
initial_rowcount = browser.tbl_rowcount.to_i
browser.click_link_by_href("#upload_csv")
c= File.join(File.dirname(__FILE__),'..','GoldstandardinputFile' )
rel_path = "#{c}/census_100_NO.csv"
ab_path = File.expand_path(rel_path)
browser.select_file_name("file",ab_path)
sleep 5
browser.testclick('/admin/gold_standard_wizards/upload_data','Upload CSV')
#('/admin/gold_standard_wizards/upload_data','submit').exists?
# clicking on Review 
browser.button_click_by_id('review_gs') # without checking the box box  gritter box appears 
flag = browser.get_browser_url
if flag == "Production Lines - Automation_Alpha | Station - Automation_Alpha | GS-data | CloudFactory"
	browser.Puts "Check box not selected, Still on the same page"
end
# user selects the checkbox , select few check box
browser.checkbox_action(0,"%7B%22name_image_url%22%3A%22http%3A%2F%2Fcfaccusoft.s3.amazonaws.com%2Ffull%2F2314ac82-47a3-4d34-9d22-9b0e0ed1970e_Name47.jpg%22%2C%22age_image_url%22%3A%22http%3A%2F%2Fcfaccusoft.s3.amazonaws.com%2Ffull%2F2314ac82-47a3-4d34-9d22-9b0e0ed1970e_Age47.jpg%22%2C%22decade%22%3A%221930%22%2C%22gender%22%3A%22NA%22%2C%22identifier%22%3A%225177703c3460daf22900082e%22%2C%22row_index%22%3A%221%22%2C%22sheet_id%22%3A%22517691803460dae8140017b4%22%7D",'set')
browser.button_click_by_id('review_gs')
flag = browser.find_image_src_id('preview_frame','http://cfaccusoft.s3.amazonaws.com/full/2314ac82-47a3-4d34-9d22-9b0e0ed1970e_Age47.jpg').exists?

if flag 
	Assertions.assertequal(true,true,"Image is same as the Image Checked")
	browser.input_text_field_frame_id('preview_frame', 'output[year]', year)
	browser.input_text_field_frame_id('preview_frame', 'output[month]', month)
	browser.button_click_frame_id('preview_frame', "Submit (Press Enter)")
	sleep 1
	browser.Puts "User Entered value #{year},#{month}"


	data_from_table1 = browser.extract_data_table(0,1,1).to_i
	data_from_table2 = browser.extract_data_table(0,1,1).to_i
	sleep 1

	if data_from_table1 == year.to_i && data_from_table2 == month.to_i
	Assertions.assertequal(true,true,"values do Match with selected and in the review as well.")
		else
	Assertions.assertequal(true,false,"values do not Match with selected and in the review as well.")
	end
browser.checkbox_idx(0)
browser.div_click_event('make_gs')
sleep 5
final_rowcount = browser.tbl_rowcount
Assertions.assert_increment(initial_rowcount,final_rowcount,true)
sleep 5


# if row found increased 
	if final_rowcount > initial_rowcount
	browser.Puts "Gold Standard got added"
	#browser.tbl_hover(1)
	sleep 2
	id = browser.getAttri_val.delete("GS Id ")
	browser.tbl_hover(1)

	browser.click_link_by_href("/admin/gold_standards/#{id}/view_data")
	flag = browser.find_image_src_id('preview_frame','http://cfaccusoft.s3.amazonaws.com/full/2314ac82-47a3-4d34-9d22-9b0e0ed1970e_Age47.jpg').exists?
			if flag
				Assertions.assertequal(true,true,"Image is  same as the Image Checked")
			else
				Assertions.assertequal(true,true,"Added Gold Standard is not the same. Please check ")
			end
			sleep 5
			browser.click_on_tab('View Data','//*[@id="gs_tabs"]/li[2]/a')
			data_from_vData1 = browser.extract_data_table(2,1,1).to_i
			data_from_vData2 = browser.extract_data_table(2,2,1).to_i
	
if data_from_vData1 == year.to_i && data_from_vData2 == month.to_i
	Assertions.assertequal(true,true,"values do Match with selected and View data pop up ")
		else
	Assertions.assertequal(true,false,"values doesnot  Match with selected and View data pop up .")
	end
#click on view link
	else
		browser.Puts "Gold standard not added"
	end
else
	Assertions.assertequal(true,false,"Image is not same as the Image Checked")
end

browser.close

# #//*[@id="check_all"]

# # c
# "/admin/lines/176/stations/573/gold_standards"


# # <input type="button" onclick="confirm('confirm popup');" value="click" />
# # b.confirm(true) {browser.button(:value => 'Upload CSV').click}

# b.driver.switch_to.alert.accept
# b.file_field.set("/Users/cloudfactory/desktop/repos/automation/GoldstandardinputFile/census_100_NO.csv")

# # b.execute_script("window.confirm = function() {return true}")



