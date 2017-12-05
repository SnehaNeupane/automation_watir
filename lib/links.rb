require '../lib/browser'

 module Links
	def click_link_by_id(id)
		Browser::LOGGER.reporter_event("click_link_by_id", id)
		link = find_link_by_id(id)
		link.when_present.click
	end

	def find_link_by_id(id)
		Browser::LOGGER.reporter_event("click_link_by_id", id)
		ui.a(:id =>id)
	end
	def click_link_by_name(name)
		Browser::LOGGER.reporter_event("click_link_by_name", name)
		link = find_link_by_name(name)
		link.when_present.click
	end

	def find_link_by_id(name)
		Browser::LOGGER.reporter_event("click_link_by_name", name)
		ui.a(:text =>name)
	end

	def find_link_by_text(text)
	
		ui.link(:text =>text)
	end

	def click_link_by_text(text)
		Browser::LOGGER.reporter_event("click_link_by_text", text)
		link = find_link_by_text(text)
		link.when_present.click
	end

	def find_link_by_href(text)
		Browser::LOGGER.reporter_event("find_link_by_href", text)
		ui.link(:href =>text)
	end

	def click_link_by_href(text)
		Browser::LOGGER.reporter_event("click_link_by_href", text)
		link = find_link_by_href(text)
		link.when_present.click
	end

	def find_by_a(text)
		Browser::LOGGER.reporter_event("click_by_a", text)
		ui.a(:title =>text)
	end  

	def click_by_a(text)
		Browser::LOGGER.reporter_event("click_by_a", text)
		click_a = find_by_a(text)
		click_a.when_present.click
		#click_a.fire_event 'onhover'
	end  

	def click_by_a_title(text)
		Browser::LOGGER.reporter_event("click_by_a_title", text)
		 click_a = ui.a(:title =>text)
		 click_a.click
	end 

	def click_link_by_class(classname)
		Browser::LOGGER.reporter_event("click_link_by_class", classname)
		click_a = find_link_by_class(classname)
		click_a.when_present.click
	end

	def find_link_by_class(classname)
		Browser::LOGGER.reporter_event("find_link_by_class", classname)
		click_a = ui.a(:class =>classname)
	end

	def click_link_by_xpath(xpath)
		Browser::LOGGER.reporter_event("click_link_by_xpath", xpath)
		click_a = find_link_by_xpath(xpath)
		click_a.fire_event 'onclick'
	end

	def find_link_by_xpath(xpath)
		Browser::LOGGER.reporter_event("find_link_by_xpath", xpath)
		click_a = ui.a(:xpath =>xpath)
	end
	
	def click_link_by_css(css)
	Browser::LOGGER.reporter_event("click_link_link_css", css)
	click_a = ui.a(:css =>css)
		click_a.when_present.click
	end

	def click_on_tab(text,xpath)
		Browser::LOGGER.reporter_event("click_on_tab", text)
		ui.a(:xpath => xpath).click
	end

 end


