
require '../lib/browser'

module Text_field

def fill_input_text_by_id(id, value)
			Browser::LOGGER.reporter_event("fill_input_text_by_id", value)
			text_field = find_text_field_by_id(id)
			text_field.when_present.set(value)
		end

		def fill_input_text_by_name(name, value)
			Browser::LOGGER.reporter_event("fill_input_text_by_name",value)
			text_field = find_text_field_by_name(name)
			text_field.when_present.set(value)
		end

		def find_text_field_by_id(id)
			Browser::LOGGER.reporter_event("find_text_field_by_id", id)
			ui.text_field(:id =>id)
		end

		def find_text_field_by_name(name)
			Browser::LOGGER.reporter_event("find_text_field_by_name", name)
			ui.text_field(:name =>name)
		end

		def find_text_field_by_class(class_name)
			Browser::LOGGER.reporter_event("find_text_field_by_class", class_name)
			ui.text_field(:class =>class_name)
		end

		def fill_input_text_by_class(class_name, value)
			Browser::LOGGER.reporter_event("fill_input_text_by_class", value)
			txt_field = find_text_field_by_class(class_name)
			txt_field.when_present.set(value)
		end

		def find_text_field_by_xpath(xpath_name)
			Browser::LOGGER.reporter_event("find_text_field_by_xpath", xpath_name)
			ui.text_field(:xpath =>xpath_name)
		end

		def fill_text_field_by_xpath(xpath_name,txt)
			textfield = find_text_field_by_xpath(xpath_name)
			textfield.set(txt)
		end

		def click_text_field_by_xpath(xpath_name)
			find_text_field_by_xpath(xpath_name).click
		end

		def get_input_text_by_class(idx_value)
			Browser::LOGGER.reporter_event("get_input_text_by_class", "")
			getValue = ui.text_field(:index =>idx_value).value
		end
	#################_ method to find and fill in the textbox with index...
		def find_text_field_by_class_index(idx,class_name)
		Browser::LOGGER.reporter_event("find_text_field_by_class", class_name)
		ui.text_field(:index => idx, :class =>class_name)
		end

		def fill_input_text_by_class_index(idx, class_name, value)
		Browser::LOGGER.reporter_event("fill_input_text_by_class", value)
		txt_field = find_text_field_by_class_index(idx,class_name)
		txt_field.when_present.set(value)
		end


		def index_fill_input_text(index,txt)
		ui.text_field(:index =>index).set(txt)
		end

		def find_text_field_class_under_form(form,name)
		Browser::LOGGER.reporter_event("find_text_field_class_under_form", form)
	 	textfield = ui.form(:action => form).text_field(:id => name)
	 	end

		def div_input_text_form(form,name,txt)
		Browser::LOGGER.reporter_event("div_input_text_form",txt)
		textfield = ui.div(:class =>form).text_field(:index =>name)
		textfield.set(txt)
		end

		
	##################### clearing content of text field#

		def clear_text_field_by_id(id)
			Browser::LOGGER.reporter_event("clear_text_field_by_id", id)
			txt_field = find_text_field_by_id(id)
			txt_field.clear
		end


		##########clicking on the text field . 

		def click_text_field_id(id)
		Browser::LOGGER.reporter_event("click_text_field_id", id)
	 	textfield = ui.text_field(:id => id)
	 	textfield.click

	 	end

################finding the text field inside a form . 

	 	def find_text_field_id(valuetxt,id)
		Browser::LOGGER.reporter_event("find_text_field_id", id)
	 	ui.form(:action =>valuetxt).text_field(:id => id)
	 	end

		def fill_text_field_id(valuetxt,id,txt)
		Browser::LOGGER.reporter_event("fill_text_field_id", valuetxt)
	 	txt_field = find_text_field_id(valuetxt,txt)
			txt_field.when_present.set(txt)
	 	end

	 	def click_form_text_field_id(valuetxt,id)
		Browser::LOGGER.reporter_event("click_form_text_field_id", id)
	 	txt_field = find_form_text_field_id(valuetxt,id)
		txt_field.click
	 	end

	 	def find_form_text_field_id(valuetxt,id)
		Browser::LOGGER.reporter_event("find_text_field_id", id)
	 	ui.form(:action =>valuetxt).text_field(:value => id)
	 	end
	#------------------------click on the text_field inside form ########

		def click_text_field_user(formname,x_path)
		Browser::LOGGER.reporter_event("click_text_field_user", x_path)
	 	textfield = find_text_field_user(formname,x_path)

	 	textfield.when_present.click

	 end

		def find_text_field_user(formname,x_path)
		Browser::LOGGER.reporter_event("click_text_field_user", formname)
	 	textfield = ui.form(:action =>formname).text_field(:xpath => x_path)
	 	end

	 	def click_text_field_class(classname)
		Browser::LOGGER.reporter_event("click_text_field_user", classname)
	 	textfield = ui.text_field(:class => classname)
	 	textfield.click
	 	end

	 	def click_text_field_class_under_frame(form)
		Browser::LOGGER.reporter_event("click_text_field_user", form)
	 	#textfield = ui.form(:class => form).text_field(:value => "Update")
	 	textfield = ui.form(:action => form).text_field(:value =>"Upload CSV")
	 	textfield.when_present.click
	 	end

	 	def click_text_field_class_under_frame_save(form)
		Browser::LOGGER.reporter_event("click_text_field_user", form)
	 	#textfield = ui.form(:class => form).text_field(:value => "Update")
	 	textfield = ui.form(:action => form).text_field(:value =>"Save")
	 	textfield.when_present.click
	 	end

		def click_text_field_class_under_frame_btn(valuetxt)
		Browser::LOGGER.reporter_event("click_text_field_user", form)
	 	textfield = text_field(:value => valuetxt)
	 	textfield.when_present.click
	 	end

	 	def find_text_field_with_form_action_name_by_class(actionname,tfClass)
		Browser::LOGGER.reporter_event("find_text_field_with_form_action_name_by_class",tfClass)
	 	textfield = ui.form(:action => actionname).text_field(:class => tfClass)
	 	end

		def click_text_field_with_form_action_name_by_class(actionname,tfClass)
		Browser::LOGGER.reporter_event("click_text_field_with_form_action_name_by_class",tfClass)
	 	textfield = find_text_field_with_form_action_name_by_class(actionname,tfClass)
		textfield.when_present.click
		end

#---------------------#
#Following methods to be used when encountered a Frame in HTML DOM
	
		def find_text_field_frame_name(fname, tfname)
		Browser::LOGGER.reporter_event("find_text_field_frame_name", tfname)
		ui.iframe(:name =>fname).text_field(:name =>tfname)
		end

		def input_text_field_frame_name(fname, tfname, value)
		Browser::LOGGER.reporter_event("input_text_field_frame_name", value)
		text_field = find_text_field_frame_name(fname, tfname)
		text_field.when_present.set(value)
		end


		def find_text_field_frame_id(fname, tfname)
			Browser::LOGGER.reporter_event("find_text_field_frame_name", tfname)
			ui.iframe(:id =>fname).text_field(:name =>tfname)
		end

		def input_text_field_frame_id(fname, tfname, value)
			Browser::LOGGER.reporter_event("input_text_field_frame_name", value)
			text_field = find_text_field_frame_id(fname, tfname)
			text_field.when_present.set(value)
		end

			def find_frame_class(classname)
			Browser::LOGGER.reporter_event("frame_class", classname)
			frame = ui.frame(:class =>classname)
			return frame
		end
		
		def click_txt_field_frame_name(fname, tfname)
			Browser::LOGGER.reporter_event("click_txt_field_frame_name", tfname)
			ui.iframe(:name =>fname).label(:text =>tfname).click
		end

		def click_txt_field_frame_id(fname, tfname)
			Browser::LOGGER.reporter_event("click_txt_field_frame_name", tfname)
			ui.iframe(:id =>fname).label(:text =>tfname).click
		end

	end