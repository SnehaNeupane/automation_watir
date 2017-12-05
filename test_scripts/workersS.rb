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
choose_worker.set "Aakrit"
#choose_worker.KeyPress('\r')
b.send_keys :enter
#b.Send_keys.:enter
#b.KeyChar 

clickoname1 = b.a(:text =>/Aakrit Bikram Shah/)
clickoname1.when_present.click 
clickoname = b.a(:text =>/Aakrit Bikram Shah/)
clickoname.when_present.click 
Amt_Check = b.span(:class => "formatted_money").text
puts Amt_Check
tab = b.link(:text => /Workspace/) 
tab.when_present.click
skip_btn = b.button(:text => "Skip")
skip_btn.fire_event "onclick"
tab2 = b.link(:text => /Workers/) 
tab2.when_present.click
choose_worker = b.text_field :name =>"query"
choose_worker.set "Aakrit"
#choose_worker.KeyPress('\r')
b.send_keys :enter
clickoname = b.a(:text =>/Aakrit Bikram Shah/)
clickoname.when_present.click 
clickoname = b.a(:text =>/Aakrit Bikram Shah/)
clickoname.when_present.click
Amt_Check2 = b.span(:class => "formatted_money").text
puts Amt_Check2
if Amt_Check2 > Amt_Check
	diff_amt = Amt_Check2 - Amt_Check
	puts "Amount has increased by:" + diff_amt
else
	puts "Amount has not increased" 
end

=begin
#Amt_Check2 = b.span(:class => "formatted_money").text
b.close


#table = b.table(:class =>"table table-bordered table-striped worker-index ajax-sorted")
#table[1][1].checkbox(:id=>"50bc5dfeed964969a8000144").set
#masquerading = b.link :id =>"masquerade_worker"



#$("div[rel='Tariq Zargar']").addClass('active')
#b.execute_script <<-JS
#	alert('hahahah');
#JS
=end