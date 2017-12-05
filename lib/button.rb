require '../lib/browser'

module Button
def find_button_by_title(name)
		Browser::LOGGER.reporter_event("find_button_by_name",name)
		ui.button(:title =>name)
	end

	def button_click_title(name)
		Browser::LOGGER.reporter_event("button_click_name", name)
		button = find_button_by_title(name)
		button.click
	end
	
	def find_button_by_text(text)
		Browser::LOGGER.reporter_event("find_button_by_name",text)
		ui.button(:text =>text)
	end

	def button_click_text(text)
		Browser::LOGGER.reporter_event("button_click_name", text)
		button = find_button_by_text(text)
		button.click
	end

	def find_button_by_name(name)
		Browser::LOGGER.reporter_event("find_button_by_name",name)
		ui.button(:name =>name)
	end

	def button_click_name(name)
		Browser::LOGGER.reporter_event("button_click_name", name)
		button = find_button_by_name(name)
		button.click
	end

	def find_button_by_id(name)
		Browser::LOGGER.reporter_event("find_button_by_id", name)
		ui.button(:id=>name)
	end

	def button_click_by_id(name)
		Browser::LOGGER.reporter_event("button_click_by_id", name)
		button = find_button_by_id(name)
		button.when_present.click
	end

	def button_click_fireEvent_name(name)
		Browser::LOGGER.reporter_event("button_click_fireEvent_name", name)
		button = find_button_by_name(name)
		button.fire_event 'onclick'
	end

	def button_click_fireEvent_id(name)
		Browser::LOGGER.reporter_event("button_click_fireEvent_id", name)
		button = find_button_by_id(name)
		button.fire_event 'onclick'
	end

	def button_click_span(name)
		Browser::LOGGER.reporter_event("button_click_span", name)
		span_click = ui.span(:class=>name)
		span_click.hover
	end

	def find_span_class(name)
		Browser::LOGGER.reporter_event("find_span_class", name)
		span_click = ui.span(:class =>name)
	end

	def click_span_class(name)
		Browser::LOGGER.reporter_event("click_span_class", name)
		click_span = click_span_class(name)
		click_span.click
	end

	def button_click_class(classname)
		Browser::LOGGER.reporter_event("button_click_class", classname)
		btn_click = ui.button(:class=>classname)
		btn_click.click
	end

####use the following method when the button is in the frame . 

	def find_button_frame_name(fname, value)
		Browser::LOGGER.reporter_event("find_button_frame_name", value)
		ui.iframe(:name =>fname).button(:value =>value)
	end

	def button_click_frame_name(fname, value)
		Browser::LOGGER.reporter_event("button_click_frame_name", value)
		button = find_button_frame_name(fname, value)
		#button.fire_event 'onclick'
		button.when_present.click
	end
	## with id

	def find_button_frame_id(fname, value)
		Browser::LOGGER.reporter_event("find_button_frame_name", value)
		ui.iframe(:id =>fname).button(:value =>value)
	end

	def button_click_frame_id(fname, value)
		Browser::LOGGER.reporter_event("button_click_frame_name", value)
		button = find_button_frame_id(fname, value)
		#button.fire_event 'onclick'
		button.when_present.click
	end

	def button_click_index(idx)
		ui.button(:index =>idx).click
	end
#################Methods related to forms
	def find_forms(value)
		Browser::LOGGER.reporter_event("find_button_frame_name", value)
		ui.form(:action =>value)
	end

end
