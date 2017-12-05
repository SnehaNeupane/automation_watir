# Description   : disable_enable_update_skill
# Pre-requisites: 
# Date: February 19 2018
#############################################################################################################
require 'pry'
require '../lib/browser'
require '../Utilities/util'
env_setting = Util.data_from_datafile['disable_enable_update_skill']
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
skill = env_setting['skill']
init_gs = env_setting['initial_gs']
choose_option = env_setting['option']

browser = Browser.new(url)
browser.click_link_by_text('Admin')
browser.fill_input_text_by_name('user[email]', username_admin )
browser.fill_input_text_by_name('user[password]', password_admin)
browser.button_click_name('commit')
browser.click_link_by_text('Workers')
browser.fill_input_text_by_class('span2', worker_id )
browser.press_enter
browser.click_link_by_text(worker_id)
sleep 2
#binding.pry# browser.click_on_link_on_table_skill('/admin/workers/6/enable_disable_skill?skill_id=21')
browser.click_link_table()
browser.click_by_a_title 'skill_row_21'



# Adding a new skill 
# tester can chosse to update, disable,add skill
# case choose_option
# when 'add'
# 	browser.click_link_by_href('#skill_temp')
# browser.click_span_class('filter-option pull-left')

# sleep 1
# browser.fill_input_text_by_class('input-block-level form-control', skill)

# browser.click_by_a(skill)
# browser.click_link_by_text('Submit')

# when 'disable'

# end






