
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
choose_worker.set "Gilberto.Von@cloudfactory.com"

b.send_keys :enter
clickoname1 = b.a(:text => /Gilberto/)
clickoname1.when_present.click 
Amt_Check = b.span(:class => "formatted_money").text
toint1 = Amt_Check.to_f
puts Amt_Check

clickoname = b.a(:text => /Gilberto/)
clickoname.when_present.click 

tab = b.link(:text => /Workspace/) 
tab.when_present.click


textfield3 = b.iframe(:name => "work_frame").text_field(:name => "output[year]")
textfield3.when_present.set 1
textfield3 = b.iframe(:name => "work_frame").text_field(:name => "output[month]")
textfield3.when_present.set 2
textfield4 = b.iframe(:name => "work_frame").text_field(:name => "output[last_name]")
textfield4.when_present.set "-"
textfield5 = b.iframe(:name => "work_frame").text_field(:name => "output[given_name]")
textfield5 .when_present.set 2


btn2 = b.iframe(:name => "work_frame").button(:value => "Submit (Press Enter)")
btn2.click
b.driver.manage.timeouts.implicit_wait = 5
btn = b.button(:id => "continue")
btn.click

tab = b.link(:text => /Team/) 
tab.when_present.click
wLink = b.a(:text => "Gilberto")
wLink.when_present.click
Amt_Check1 = b.span(:class => "formatted_money").text
toint2 = Amt_Check1.to_f
puts Amt_Check1

puts "Amount is changed by #{toint2 - toint1}"
b.close
