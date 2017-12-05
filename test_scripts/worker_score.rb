
require "watir-webdriver"
b = Watir::Browser.new :chrome
b.goto ("cloudfactory.qa") #opens workers.cloudfactory.qa
textfield1 = b.text_field(:name => "developer_session[email]")
textfield1.set "sushil.jakibanja@sproutify.com"
textfield2 = b.text_field(:name => "developer_session[password]")
textfield2.set "44FFffLN"
button = b.button :name=> "commit" #inputs userid and password and click on button
button.click
Adminlink = b.a(:text => "Admin")
Adminlink.when_present.click
textfield1 = b.text_field(:name => "user[email]")
textfield1.set "admin@cloudfactory.com"
textfield2 = b.text_field(:name => "user[password]")
textfield2.set "secret007"
button = b.button :name=> "commit" #inputs userid and password and click on button
button.click
worker_click = b.a(:text => "Workers")
worker_click.click
input_wid = b.text_field(:class => "span2")
input_wid.set "52ef56500dc521d12a000004"
b.send_keys :enter
wid_link = b.link(:text => "52ef56500dc521d12a000004")
wid_link.when_present.click
wid_H = b.link(:text => "History")
wid_H.when_present.click
puts "waiting 5 seconds to fetch the text"
b.driver.manage.timeouts.implicit_wait = 5	
get_score = b.table[1][2].when_present.text
	puts get_score + " Grabbing  initial score ."
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
clickoname1 = b.link(:text => /Gilberto Von/)
sleep 3
clickoname1.when_present.click 
Amt_Check = b.span(:class => "formatted_money").text
toint1 = Amt_Check.to_f
puts Amt_Check
clickoname = b.a(:text => /Gilberto Von/)
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
btn = b.button(:id, "continue")
btn.click
tab = b.link(:text => /Team/) 
tab.when_present.click
wLink = b.a(:text => "Gilberto Von")
wLink.when_present.click
Amt_Check1 = b.span(:class => "formatted_money").text
toint2 = Amt_Check1.to_f
puts Amt_Check1
puts "Amount is changed by #{toint2 - toint1}"
b.goto ("cloudfactory.qa") 
sleep 5
if b.text_field(:name => "developer_session[email]").exists?
textfield1 = b.text_field(:name => "developer_session[email]")
textfield1.set "sushil.jakibanja@sproutify.com"
textfield2 = b.text_field(:name => "developer_session[password]")
textfield2.set "44FFffLN"
button = b.button :name=> "commit" #inputs userid and password and click on button
button.click
else 
Adminlink1 = b.a(:text => "Admin")
Adminlink1.when_present.click
end
if b.text_field(:name => "user[email]").exists?
textfield1 = b.text_field(:name => "user[email]")
textfield1.set "admin@cloudfactory.com"
textfield2 = b.text_field(:name => "user[password]")
textfield2.set "secret007"
button = b.button :name=> "commit" #inputs userid and password and click on button
button.click
else
worker_click = b.a(:text => "Workers")
worker_click.click
input_wid = b.text_field(:class => "span2")
input_wid.set "52ef56500dc521d12a000004"
b.send_keys :enter
wid_link = b.link(:text => "52ef56500dc521d12a000004")
wid_link.when_present.click
wid_H = b.link(:text => "History")
wid_H.when_present.click
get_score2= b.table[1][2].when_present.text
puts get_score2 + "is updated score."
end


server = Server.new('qa')

server.url
seerver.username




