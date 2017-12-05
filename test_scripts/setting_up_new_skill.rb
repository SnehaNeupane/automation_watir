# Description   : Setting up a Desired Skill
# Pre-requisites:  Worker needs to be identified. 
# Date: February 18 2018
Dir[File.join(File.expand_path('../../', __FILE__),'Data/*.rb')].each {|file| require (file)}
require '../Utilities/util'
env_setting = Util.data_from_datafile['new_skill_gets_7gs']
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

browser = Browser.new(url)

sleep(3)
browser.click_link_by_text('Admin')
browser.fill_input_text_by_name('user[email]', username_admin )
browser.fill_input_text_by_name('user[password]', password_admin)
browser.button_click_name('commit')

browser.click_link_by_text('Workers')
browser.fill_input_text_by_class('span2', worker_id )
browser.press_enter

browser.click_link_by_text(worker_id)

browser.click_link_by_href('#skill_temp')
browser.click_span_class('filter-option pull-left')

sleep 1
browser.fill_input_text_by_class('input-block-level form-control', skill)

browser.click_by_a(skill)
browser.click_link_by_text('Submit')

browser.close





