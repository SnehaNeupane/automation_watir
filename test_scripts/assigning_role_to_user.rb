# Description   : Update user account to given role.
# Pre-requisites: There should be a user. If there's no user, please run "************************" first for creating new user .
# Date: February 21 2014
#############################################################################################################


Dir[File.join(File.expand_path('../../', __FILE__),'Data/*.rb')].each {|file| require (file)}

env_setting = Util.data_from_datafile['user_assign_role']
url = env_setting['url_admin']
username_admin = env_setting['username_admin']
password_admin = env_setting['password_admin']
username = env_setting['username_cf']



browser = Browser.new(url)
browser.fill_input_text_by_name('user[email]', username_admin )
browser.fill_input_text_by_name('user[password]', password_admin)
browser.button_click_name('commit')
browser.wait_till_load(10)

browser.click_link_by_href('/admin/users')
browser.fill_input_text_by_class('span2', username)
browser.press_enter
browser.wait_till_load(2)
browser.click_link_by_text(username)
browser.update_checkbox_by_name_value('user_roles[]', "23")

browser.button_click_name("commit")

browser.wait_till_load(2)

if browser.contains_text?("Role successfully added.")
  puts "Role has been successfully added."
else
  puts "Sorry! something went wrong."
end

















browser.close









# url = "cloudfactory.qa/users/sign_in"
# username_admin = "admin@cloudfactory.com"
# password_admin = "secret007"
# username = "laxman.shrestha@cloudfactory.com"

# browser.text_field(user[email]).set(username_admin)


