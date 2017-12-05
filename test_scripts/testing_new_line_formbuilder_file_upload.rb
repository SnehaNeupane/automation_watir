#Purpose : Purpose of this test script is to validate line creation with file upload
#Prerequisite : file named Census_Person_CR.html location :'automation/GoldstandardinputFile'

Dir[File.join(File.expand_path('../../', __FILE__),'Data/*.rb')].each {|file| require (file)}
c = File.join(File.dirname(__FILE__),'..','GoldstandardinputFile' )
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
	filename = "Census_Person_CR.html"

	browser = Browser.new(url)
	browser.fill_input_text_by_name('user[email]', username )
	browser.fill_input_text_by_name('user[password]', pass)
	browser.button_click_name('commit')	
	browser.click_link_by_href('/admin/lines')
	browser.click_link_by_href('/admin/lines/new')

	browser.click_li_form_title('/admin/lines','upload_custom_template')

	browser.click_li_form_index('/admin/lines',0)
	browser.fill_text_field_by_xpath('//*[@id="name"]',line_name)
	browser.button_click_index(0)

	rel_path = "#{c}/#{filename}"
	ab_path = File.expand_path(rel_path)
	browser.select_file_name_class("file_input",ab_path)
	sleep 1
	browser.click_text_field_by_xpath('//*[@id="file_upload_form"]/div[3]/input')
	sleep 1

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






