
require "watir-webdriver"
b = Watir::Browser.new :chrome
b.goto ("worker.cloudfactory.qa") #opens workers.cloudfactory.qa
textfield1 = b.text_field :name => "worker[email]"
textfield1.set "admin@cloudfactory.com"
textfield2 = b.text_field :name => "worker[password]"
textfield2.set "secret"
button = b.button :name=> "commit" #inputs userid and password and click on button
button.click
tab = b.link(:text => /Workers/) 
tab.when_present.click
choose_worker = b.text_field :name =>"query"
choose_worker.set "pete.waelchi@cloudfactory.com"

b.send_keys :enter
clickoname1 = b.a(:text => /Pete Waelchi/)
clickoname1.when_present.click 
Amt_Check = b.span(:class => "formatted_money").text
puts Amt_Check

clickoname = b.a(:text => /Pete Waelchi/)
clickoname.when_present.click 

tab = b.link(:text => /Workspace/) 
tab.when_present.click


textfield3 = b.iframe(:name => "work_frame").text_field(:name => "output[year]")
textfield3.when_present.set 1
textfield3 = b.iframe(:name => "work_frame").text_field(:name => "output[month]")
textfield3.when_present.set 1
textfield4 = b.iframe(:name => "work_frame").text_field(:name => "output[last_name]")
textfield4.when_present.set "-"
textfield5 = b.iframe(:name => "work_frame").text_field(:name => "output[given_name]")
textfield5 .when_present.set "1"

puts "Entered Correct value"
btn2 = b.iframe(:name => "work_frame").button(:value => "Submit (Press Enter)")
btn2.click
puts "button click"
tab = b.link(:text => /Team/) 
tab.when_present.click
wLink = b.a(:text => "Pete Waelchi")
wLink.when_present.click
Amt_Check1 = b.span(:class => "formatted_money").text
puts Amt_Check1

b.close

=begin


b = b.button(:id => "continue")
tab = b.link(:text => /Workers/) 
tab.when_present.click
choose_worker = b.text_field :name =>"query"
choose_worker.set "pete"
#choose_worker.KeyPress('\r')
b.send_keys :enter

clickoname1 = b.a(:text => /Pete Waelchi/)
clickoname1.when_present.click 
clickoname = b.a(:text => /Pete Waelchi/)
clickoname.when_present.click 
else 


puts "Normal Task assigned "

textfield3 = b.iframe(:name => "work_frame").text_field(:name => "output[year]")
textfield3.when_present.set 34
textfield4 = b.iframe(:name => "work_frame").text_field(:name => "output[last_name]")
textfield4.when_present.set "-"
textfield5 = b.iframe(:name => "work_frame").text_field(:name => "output[given_name]")
textfield5 .when_present.set "Pearl"
btn2 = b.iframe(:name => "work_frame").button(:value => "Submit (Press Enter)")
btn2.click
tab = b.link(:text => /Workers/) 
tab.when_present.click
choose_worker = b.text_field :name =>"query"
choose_worker.set "Pete Waelchi/"
#choose_worker.KeyPress('\r')
b.send_keys :enter
#b.Send_keys.:enter
#b.KeyChar 

clickoname1 = b.a(:text =>/Pete Waelchi/)
clickoname1.when_present.click 
clickoname = b.a(:text =>/Pete Waelchi/)
clickoname.when_present.click 
end

=end
