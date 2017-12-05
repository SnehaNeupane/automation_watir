#Description : This test script is to test the line , form builder content review
Dir[File.join(File.expand_path('../../', __FILE__),'Data/*.rb')].each {|file| require (file)}

env_setting1 = Util.read_data_from_file('line')
env_setting= env_setting1['testing_New_Line_useformbuilder_content_review']
url = ENV['UrlCP']
username = ENV['user_id_CP']
pass = ENV['password_pass_CP']
line_name = env_setting['line_name']
account = env_setting['account']
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
	title = browser.test_div_find('#cl-title > div:nth-child(1)').text
	if title == 'Title'
		Assertions.assertequal(true,true, "title is correct")
	else 
		Assertions.assertequal(true,false, "Not Present or something else #{title}")
	end
sleep 1
  instructions = browser.test_div_find('#cl-title > div:nth-child(2)').text
  if instructions == 'Instructions'
	Assertions.assertequal(true,true, "instructions")
else
	Assertions.assertequal(true,false, "instructions not present or something else")
end
sleep 1
Image = browser.test_div_find('#cl-data-source > div:nth-child(1)').text
#cl-data-source > div:nth-child(1)
if Image == 'Image'
	Assertions.assertequal(true,true, "Image")
else
	Assertions.assertequal(true,false, "Image not present or something else")
end

sleep 1
Link = browser.test_div_find('#cl-data-source > div:nth-child(3)').text
#cl-data-source > div:nth-child(1)
if Link == 'Link'
	Assertions.assertequal(true,true, "Link")
else
	Assertions.assertequal(true,false, "Link not present or something else")
end
			
sleep 1
Web_Page = browser.test_div_find('#cl-data-source > div:nth-child(4)').text
#cl-data-source > div:nth-child(1)
if Web_Page == 'Web Page'
	Assertions.assertequal(true,true, "Web Page")
else
	Assertions.assertequal(true,false, "Web Page not present or something else")
end

sleep 1
Audio = browser.test_div_find('#cl-data-source > div:nth-child(5)').text
#cl-data-source > div:nth-child(1)
if Audio == 'Audio'
	Assertions.assertequal(true,true, "Audio")
else
	Assertions.assertequal(true,false, "Audio not present or something else")
end

sleep 1
Text_Input = browser.test_div_find('#cl-task > div:nth-child(1)').text
if Text_Input == 'Text Input'
	Assertions.assertequal(true,true, "Text_Input")
else
	Assertions.assertequal(true,false, "#{Text_Input} not present or something else")
end
sleep 1
Text_Area = browser.test_div_find('#cl-task > div:nth-child(2)').text
if Text_Area == 'Text Area'
	Assertions.assertequal(true,true, "Text_Input")
else
	Assertions.assertequal(true,false, "#{Text_Input} not present or something else")
end

sleep 1
check_box= browser.test_div_find('#cl-task > div:nth-child(3)').text
if check_box == 'Check Box'
	Assertions.assertequal(true,true, "check_box")
else
	Assertions.assertequal(true,false, "#{check_box} not present or something else")
end

sleep 1
Multiple_Choice= browser.test_div_find('#cl-task > div:nth-child(4)').text

if Multiple_Choice == "Multiple Choice"
	Assertions.assertequal(true,true, "Multiple_Choice")
else
	Assertions.assertequal(true,false, "#{Multiple_Choice} not present or something else")
end

sleep 1
List= browser.test_div_find('#cl-task > div:nth-child(5)').text

if List == 'List'
	Assertions.assertequal(true,true, "List")
else
	Assertions.assertequal(true,false, "#{List} not present or something else")
end

	#rowser.test_div('#job-form > div.form-item.title_item.wizard_form_builder_form_item_title_item.wizard_form_builder_models_title_item_45.active > div.hider')

	#//*[@id="cl-title"]/div[1]





