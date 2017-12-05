
require '../lib/browser'
require '../Utilities/util'
require '../Utilities/log'
require 'pry'
	
module Assertions		
	
def self.assertequal(actual, expected, msg)
ENV['remarks'] = 'Passed'
		log = Log.new()
		if actual == expected
			flag = 'Passed'
		else 
			flag = 'Failed'
			case msg
				when 0
				log.reporter_event("#{msg} :: Value not Updated , Please re-run or verify manually assertion done......",'',flag)
				puts "#{msg} , #{flag}"
				else
					log.reporter_event("#{msg} :: Assertions Complete............... ",'',flag)
					puts "#{msg} , #{flag}"
			end
					log.reporter_event("#{msg} :: Assertions Complete............... ",'',flag)
					puts "#{msg} , #{flag}"

		if flag == 'Failed'
			ENV['remarks'] = 'Failed'
			ENV['mesg'] = "#{msg}"
			end

	end
end

	def self.assert_text_exists(actual_text, expected) # needs to pass , True or false . if a text presence is required pass True.
		flag = contains_text(actual_text) # returns true if the actual text is found
		if flag == true
			msg = true
		elsif flag == false
			msg= Failed
		end
	end


	def self.assert_button_exists(browser,findby,findby_txt,expected) 
	# findby is , by what a button needs to identified with eg, id, text, name span etc , 
	#findby_txt is value of the property, expected_text is either true or false . true for validating presence of the element false otherwise . 
		case findby
		when 'title'
		bflag = browser.find_button_by_title(findby_txt).exists?
		when 'text'
		bflag = browser.button_click_text(findby_txt).exists?
		when 'name'
		bflag = browser.find_button_by_name(findby_txt).exists?
		when 'id'
		bflag = browser.find_button_by_id(findby_txt).exists?
		when 'fireEvent_name'
		bflag = browser.button_click_fireEvent_name(findby_txt).exists?
		when 'fireEvent_id'
		bflag = browser.button_click_fireEvent_id(findby_txt).exists?
		when 'click_span'
		bflag = browser.button_click_span(findby_txt).exists?
		else
			puts  'selection out of range'
		end
		if bflag
			msg = true
		else
			msg = false
		end
			assertequal(msg ,expected, "assert_button_exists") 
	end


	def self.assert_text_field_exists(browser,findby,findby_txt,expected) 
		case findby
			when 'id'
			bflag = browser.find_text_field_by_id.exists?
			when 'name'
			bflag = browser.find_text_field_by_name.exists?
			when 'class'
			bflag = browser.find_text_field_by_class.exists?
			when 'classindex'
			bflag = browser.find_text_field_by_class_index.exists?
			when 'form_id'
			bflag = browser.find_text_field_id.exists?
		else
		end	
			puts 'selection out of range'
		
				if bflag
				msg = true
				else
				msg = false
				assertequal(msg ,expected, "assert_text_field_exists") 		
				end
	end

	def self.assert_link(browser,findby,findby_txt,expected)

		case findby
			when  'id'
			bflag = browser.find_link_by_id.exists?
			when 'name'
			bflag = browser.link_by_name.exists?
			when 'text'
			bflag = browser.find_link_by_text.exists?
			when 'href'
			bflag = browser.find_link_by_href.exists?
			when 'title'
			bflag = browser.find_by_a.exists?
		else
				puts 'selection our of range'
		end		
				if bflag
				msg = true
				else
				msg = false
				assertequal(msg ,expected, "assert_link") 		
				end
	end		

	def self.assert_tabledata(row,col, expected_text)
			act_value = get_value_table(row, col)
			assertequal(act_value, expected_text, "assert_tabledata")
	end

	def self.assert_increment(init_val,fin_val,expected_text)# expected_text is true or false , true being verifying positive number false being -ve number .
		if fin_val == nil || fin_val == ""
			fin_val = 0
		end
		if init_val == nil || fin_val == ""
			init_val = 0
		end
		if fin_val > init_val
			flag = true
		else 
			flag = false
		end
		msg = fin_val - init_val
		assertequal(flag, expected_text, msg)
	end
end
