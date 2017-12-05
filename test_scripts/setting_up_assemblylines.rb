# Description   : Setting up the Assembly line 
# Pre-requisites: A template needs to be created . or find a script to create a template in assembly lines
# Date: February 19 2018
#############################################################################################################


Dir[File.join(File.expand_path('../../', __FILE__),'Data/*.rb')].each {|file| require (file)}
env_setting = Util.data_from_datafile['setting_up_assemblylines']
url = env_setting['url_cf']
username = env_setting['username_cf']
password = env_setting['password_cf']


username_admin = env_setting['username_admin']
password_admin = env_setting['password_admin']
algorithm = env_setting['algorithm']
worker_name = env_setting['workername']

skill = env_setting['skill']
init_gs = env_setting['initial_gs']

browser = Browser.new(url)
browser.click_link_by_text('Admin')
browser.fill_input_text_by_name('user[email]', username_admin )
browser.fill_input_text_by_name('user[password]', password_admin)
browser.button_click_name('commit')

browser.wait_till_load(10)

browser.click_link_by_href('/admin/lines')


browser.click_link_by_href('/admin/lines/249/overview')
browser.click_link_by_href('/admin/lines/249')
browser.select_item_list_by_id('skill_id', skill)
browser.select_item_list_by_id('initial_gs_count', init_gs)
browser.select_item_list_by_id('algo_set', init_gs)

browser.close










