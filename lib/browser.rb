require 'rubygems'
require 'watir-webdriver'
require 'selenium-webdriver'
require '../Utilities/results'
require '../Utilities/util'
require '../Utilities/log'
require '../lib/assertions'
require '../lib/links'
require '../lib/button'
require '../lib/text_field'
require 'pry'

CONFIG = YAML.load_file('../config/environment.yml')[ARGV.first || 'development'] 

class Browser
	include Links
	include Button
	include Text_field
	attr_accessor :ui 

	LOGGER = Log.new
	
	def initialize(url)
		#self.ui = Watir::Browser.new(:chrome), :switches =>%w[--start-maximized] # :service_log_path =>LOG_FILE)
		self.ui = Watir::Browser.new(:chrome, :switches => %w[--test-type])
		self.ui.window.resize_to(1280,1024) 
		LOGGER.reporter_event("initialize browser and other setups ",url)
		self.ui.goto(url)	 
	end
	## =================================================
	# closes the browser
	def close
		LOGGER.reporter_event("closing browser",'')
		ui.close
	end

	def get_browser_title
		LOGGER.reporter_event("get_browser_title",'',)
		return ui.title
	end

	def get_browser_url
		LOGGER.reporter_event("get_browser_url",'',)
		ui.url
	end

################## closes the fancy box with id
	def fancy_box_close(id)
		click_a = ui.a(:id =>id)
		click_a.when_present.click
	end
##################################

def click_link_by_text_class(classname,text)
	lnkclass = find_link_by_class(classname)
	lnktext = find_link_by_text(text)
	clickontxtclass = lnkclass.lnktext
	clickontxtclass.click
end

#########################Methods realated to Div functioning@@@

	def div_click(idx,classname)
		click_a = find_div_class(idx,classname)
		click_a.when_present.click
	end

	def find_div_class(idx,classname)
		click_a = ui.div(:index =>idx, :class =>classname)
	end

	def div_click_id(id)
		click_a = find_div_id(id)
		click_a.when_present.click
	end

	def find_div_id(id)
		click_a = ui.div(:id =>id)
	end

	def fill_input_in_div_class(divclass,id,value)
	input = find_div_class(divclass)
	input.fill_input_text_by_id(id, value)
	end

	def div_click_link(classname)
		clicklnk = find_div_class(classname)
		clicklnk.link.click
	end

	def div_click_event(id)
		 find_div_id(id).fire_event "onclick"
	end

	def test_div_find(css)
		ui.div(:css =>css)
	end

	def click_div_test(css)
		test_div_find(css).click
	end

	####################### methods  for Div and H's ##################

	def get_text_H4(classname)
		LOGGER.reporter_event("click_on_text_H4", classname)
		h = find_div_class(classname)
		h.h4.text
	end

	def get_text_H1(idx,classname)
		LOGGER.reporter_event("click_on_text_H1", classname)
		h = find_div_class(idx, classname)
		h.h1.text
	end

	############## li methods######
	def find_li_text(text)
		ui.ul(:class =>'nav nav-tabs tt_tabs').li(:text =>text)
	end

	def click_li_text(text)
		li_text= find_li_text(text)
		li_text.click
	end

 	def find_ul_class
 		ui.li(:class =>'head_label drill')
	end	

	def click_ul_class
		ul_click = find_ul_class
		ul_click.click
	end

	def click_li_text
		ui.form(:id =>'cf_task_form').li(:id =>'year').click
	end

	def click_li_form_title(fname, value)
		LOGGER.reporter_event("find_button_frame_name", value)
		ui.form(:action =>fname).li(:title =>value).click
		end

	def click_li_form_index(fname, value)
		LOGGER.reporter_event("find_button_frame_name", value)
		ui.ul(:class =>"template_list").li(:index => 0).click
	end

##-----------------------------------------------------
## Methods to get value from the element SPAn
##-----------------------------------------------------

	def find_span_class(name)
		LOGGER.reporter_event("find_span_class", name)
		ui.span(:class =>name)
	end

	def find_span_text(text)
		LOGGER.reporter_event("find_span_class", text)
		ui.span(:text =>text)
	end

	def getValue_span_class(name)
		LOGGER.reporter_event("getValue_span_class", name)
		get_value = find_span_class(name)
		getValue_span_class = get_value.text
	end
	
	def click_span_class(name)
		LOGGER.reporter_event("click_span_class", name)
		spanclick = find_span_class(name)
		spanclick.click
	end
	def click_span_text(text)
		LOGGER.reporter_event("click_span_class", text)
		spanclick = find_span_text(text)
		spanclick.click
	end

	def get_value_span_indx
		ui.div(:class =>"header header_tmp", :text => /Completed/).text#(:class =>name, :index => idx).value
	end
#-------------------------------------------------------
	# Press Enter
	def press_enter
		LOGGER.reporter_event("press_enter", '')
	#element.send_keys "enter"
	ui.send_keys [:return]
	end

	def space
		LOGGER.reporter_event("space", '')
		ui.send_keys [:space]
	end

	def press_esc
		LOGGER.reporter_event("press_esc", '')
		ui.send_keys [:escape]
	end
	#-----------------------
	# method to wait 

	def wait_till_load(seconds)
		LOGGER.reporter_event("wait_till_load", seconds)
		ui.driver.manage.timeouts.implicit_wait = (seconds)
	end

	#-------------------------------------------------------
	#Methods to extract value from the TABLE and table related methods 
	def tbl_rowcount
		ui.table.trs.count
	end
	
	def get_value_table(row, col)
		table_value = ui.table[row][col].when_present.text
		LOGGER.reporter_event("get_value_table", row)
		return table_value
	end

	def get_value_table_withindexandid(row,col)#,id,row, col)
	LOGGER.reporter_event("get_value_table", row)
	table_value = ui.table(:index =>1)#, :id => id)[row][col]
	table_value[row][col].h3.text
	end 	
 

	def hover_table_withindexandid(idx,row,col)#,id,row, col)
	LOGGER.reporter_event("get_value_table", row)
	table_value = ui.table(:index =>idx)#, :id => id)[row][col]
	table_value[row][col].hover
	end
	
def get_table_data_index(idx,row,col)#,id,row, col)
	LOGGER.reporter_event("get_value_table", row)
	table_value = ui.table(:index =>idx)#, :id => id)[row][col]
	table_value[row][col].text
	end
	
	def get_value_table_href(row,col)#,id,row, col)
	LOGGER.reporter_event("get_value_table", row)
	table_value = ui.table(:id => 'factory_table')
	table_value[row][col].attribute_value("a")
	end 

	def link_existence_by_href(lnktext)#,id,row, col)
		linktest = ui.find_link_by_href(lnktext).exists?
	end 

	def click_value_table(row,col)
		clk = ui.table[row][col]
		LOGGER.reporter_event("click_value_table", row)
		clk.fire_event 'onclick'
	end

	def click_link_table
		clk = ui.table(:class => 'table table-bordered table-striped table-hover')
		clk.td.link.click
	end

	def click_on_link_on_table(lnktext)
		LOGGER.reporter_event("click_on_link_on_table", lnktext)
  	ui.table.links.each do |link| 
  			lnk = ui.a(:text =>lnktext)
  				if link == lnk
    			link.when_present.click 
    			ui.a(:text =>lnktext).click
    			break
 				end 
			end 
		end
# prints the link text of the table .
			def view_text_link_on_table
		LOGGER.reporter_event("click_on_link_on_table",'')
  	ui.table.links.each do |link| 
  			puts link.text
			end 
		end

		def click_text_link_on_table
		LOGGER.reporter_event("click_on_link_on_table",'')
  	ui.table.links.each do |link| 
  			link.click
			end 
		end

		def exists_text_link_on_table
		LOGGER.reporter_event("click_on_link_on_table",'')
  	ui.table.links.each do |link| 
  			 link.exists?
			end 
		end

		def click_link_table_index
		
				aa = ui.table.link(:index =>0)
				
			end
		
		def click_on_link_on_table_skill(lnktext)
		LOGGER.reporter_event("click_on_link_on_table", lnktext)

  	ui.table.links.each do |link| 
  	 
  			lnk = ui.a(:href =>lnktext)
  				if link == lnk
    			link.when_present.click 
    			ui.a(:href= =>lnktext).fire_event 'onMouseOver'
    			break
 				end 
			end 
		end

			def validating_empty_table(classname)
			emptytext = ui.table.td(:class =>classname).text
			end

# temporary index is hardcoded needs to be optized later ...
			def validating_empty_table_secondtable(classname)
			emptytext = ui.table(:index => 1).td(:class =>classname).text
			end

			def table_text(classname)
				tdfind = ui.table.td(:text => classname)
				tdfind.exists?
			end

			def extract_data_table(tindex,rindex,cindex)
				LOGGER.reporter_event("extract_data_table",'extracting data from table ')
				ui.table(:index =>tindex).tr(:index =>rindex).td(:index =>cindex).text
			end
#-------------------------------------------------------

	def check_table_div_index(idx,txt)
     ui.table.td(:index =>idx).div(:class =>txt)
	end 

	#--------------------------------- Methods to select a list from the dropdown list .

	def find_select_item_list_by_name(name)
		LOGGER.reporter_event("find_select_item_list_by_name", name)
		ui.select_list(:name =>name)
	end

	def select_item_list_by_id(id, listitem)
		LOGGER.reporter_event("select_item_list_by_id", listitem)
		select_skill = ui.select_list(:id => id)
		select_skill.select(listitem)
	end

	def select_item_list_by_name(name, listitem)
		LOGGER.reporter_event("select_item_list_by_name", listitem)
		select_list = find_select_item_list_by_name(name)
		select_list.select(listitem)
	end

	def select_item_list_by_classname(classname,listitem)
		LOGGER.reporter_event("find_select_item_list_by_classname", classname)
		selectlist = ui.select_list(:class => classname)
		selectlist.select(listitem)
	end


	def select_item_list_by_name_under_frame(id,listitem)
		LOGGER.reporter_event("select_item_list_by_name_under_frame", id)
		select_skill = ui.form(:class =>"update_station").select_list(:id =>id).option(:text => listitem)
		select_skill.wait_until_present
		select_skill.select
	end

	def select_item_list_by_name_under_frame_action(action_name,id,listitem)
		LOGGER.reporter_event("select_item_list_by_name_under_frame", id)
		select_skill = find_item_list_by_name_under_frame_action(action_name,id,listitem)
		select_skill.wait_until_present
		select_skill.select
	end

	def find_item_list_by_name_under_frame_action(action_name,id,listitem)
		LOGGER.reporter_event("find_item_list_by_name_under_frame_action", listitem)
		select_skill = ui.form(:action => action_name).select_list(:id =>id).option(:text => listitem)
	end

	def text_exists(text)
		LOGGER.reporter_event("text_exists",'')
		ui.text.include?(text)
	end
#----------------------------------------#
#Methods for checkboxes

	def update_checkbox_by_name_value(labelname,chkvalue)
		LOGGER.reporter_event("update_checkbox_by_name_value", chkvalue)
		checkbox = ui.checkbox(:name =>labelname, :value =>chkvalue)	
		#ui.label(:class => 'labelname').parent.checkbox(:name => 'chkvalue').set 
		checkbox.when_present.set
	end

	def check_checkbox(idx)
		LOGGER.reporter_event("update_checkbox_by_name_value", idx)
		ui.form(:action =>"/admin/users").checkbox(:value =>idx).click
	end

	def check_checkbox_on_off(classname,idx)
		LOGGER.reporter_event("update_checkbox_by_name_value", idx)
		ui.form(:class =>classname).checkbox(:value =>idx).click
	end

	def clear_checkbox_by_name_value(name,value)
		LOGGER.reporter_event("clear_checkbox_by_name_value", value)
		checkbox = ui.checkbox(:name =>name, :value =>value)	
		checkbox.when_present.clear
	end

#user can select and clear the selection in the checkbox.
	def checkbox_action(idx,val,act)
		LOGGER.reporter_event("checkbox_click", val)
		chekbox = ui.checkbox(:index =>idx, :value => val)
			case act
				when 'set'
				chekbox.set
				when 'clear'
				chekbox.clear
				end
	end

	def checkbox_clear(val,act)
		LOGGER.reporter_event("checkbox_click", val)
		chekbox = ui.checkbox(:value => val)
		chekbox.clear
	end

	def checkbox_idx(idx)
	ui.checkbox(:index =>idx).set
	end

#-----------------------------------------------#
	def contains_text(text)
		LOGGER.reporter_event("contains_text", text)
		ui.text.include?(text)
	end

	# methods to use 32  ### use this methods , application opens up in a new tab
	def windows_use_last
	ui.windows.last.use
	end

	def js_popup
		#ui.alert.close
		ui.execute_script("window.confirm = function() {return false}")
	end

	def extracting_value_from_tab(id)
		LOGGER.reporter_event("extracting_value_from_tab", id)
		case id
			when "in_progress"

			val = ui.li(:id =>id).link.text
			val1 = val.delete("In progress( )")

			when "completed"
			val = ui.li(:id =>id).link.text
			val1 = val.delete("Completed()")
		end	
	end

	def find_image_src(fname,src)
	ui.iframe(:name =>fname).image(:src =>src)#"http://cfaccusoft.s3.amazonaws.com/full/2314ac82-47a3-4d34-9d22-9b0e0ed1970e_Age47.jpg" )#, :src =>'http://cfaccusoft.s3.amazonaws.com/full/2314ac82-47a3-4d34-9d22-9b0e0ed1970e_Age47.jpg')
	end

	def find_image_src_id(id,src)
	ui.iframe(:id =>id).image(:src =>src)#"http://cfaccusoft.s3.amazonaws.com/full/2314ac82-47a3-4d34-9d22-9b0e0ed1970e_Age47.jpg" )#, :src =>'http://cfaccusoft.s3.amazonaws.com/full/2314ac82-47a3-4d34-9d22-9b0e0ed1970e_Age47.jpg')
	end


	def del_unwanted_chars(chars)
		delete(chars)
	end

	def Puts(txt, name = "", msg = "")
		LOGGER.reporter_event(txt,name, msg)
	end

	def select_file_name(name,filename)
	ui.file_field(:name =>name).set(filename) 	
	end

		def select_file_name_class(name,filename)
	ui.file_field(:class =>name).set(filename) 	
	end

	def testclick(frm,name)
		ui.form(:action =>frm).button(:text =>name).click
	end

	def testcheck(idx)
		ui.checkbox(:index =>idx).set
	end
	# basic hover in the table
	def tbl_hover(hv_row)
		ui.table.tr(:index =>hv_row).hover
	end

	def getAttri_val
		ui.checkbox(:index =>1).attribute_value(:title)
	end
############################
#P,,Paragraph related methods
# finding the text of the praragraph

	def get_paragraph(idx)
		ui.p(:index =>idx).text
	end


end
