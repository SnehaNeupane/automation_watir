Dir[File.join(File.expand_path('../../', __FILE__),'Data/*.rb')].each {|file| require (file)}

env_setting1= Util.read_data_from_file('test')
env_setting= env_setting1['testdemo']
url =env_setting['url']
id = env_setting['username']
pass = env_setting['password']

browser = Browser.new(url)
browser.fill_input_text_by_name('user[email]',id)

browser.fill_input_text_by_name('user[password]',pass)
browser.button_click_name('commit')

title = browser.get_browser_title

if  title == "Production Lines | CloudFactory"

		Assertions.assertequal(true,true, "After clicking on submit it goes  to production line page   Passed")
	else 
		Assertions.assertequal(true,false, "After clicking on submit it goes  to production line page   Passed")
end     


browser.close