
require '../lib/browser'
require '../Utilities/util'
require '../Utilities/results'
require '../Utilities/log'
require 'csv'
require 'pry'


b_path  = File.join(File.dirname(__FILE__), '..' )
path_flow = "#{b_path}/flow/flow.txt"
path_test_script ="#{b_path}/test_scripts"
ENV['remarks'] = 'Passed'
status = 'Passed'
#status = ENV['remarks']
msg = nil 
logs = Log.new()

class MainScript
		attr_accessor :browser, :url
		def initialize(url)
			@url = url
		end
		def setup_browser
			browser = Browser.new(self.url)
		end
end		

initializing_flow = Util.comprehensive_run(path_flow)
test_script_to_execute = []
initializing_flow.each do |module_name|	
	test_script_to_execute << Util.comprehensive_run_module(module_name)
		end
	test_script_to_execute.each do |module_file|
	module_file.each do |module_name, file|
		file.each do |filename|
		logs.report_module_file_name(module_name, filename)
		ENV['remarks'] = 'Passed'
		status = 'Passed'
		ENV['mesg'] = " "

		begin
			path = "#{path_test_script}/#{filename}"
			puts path
			begin_transaction = Time.now.to_i
			 #duration2 = Benchmark.measure 	do
			load "#{path}"
			end_transaction = Time.now.to_i
			duration = (end_transaction - begin_transaction).to_s
			rescue Exception => e
				if e.message.empty? == false 
				status = 'Failed'
				ENV['mesg'] = e.message 
				mesg = ENV['mesg']
				puts ENV['mesg'] 
				else
				status = ENV['remarks']
				mesg = ENV['mesg']
				end
			end_transaction = Time.now.to_i
			duration = (end_transaction - begin_transaction).to_s
				end
			if ENV['remarks'] == 'Failed'
			status ='Failed'
			mesg = ENV['mesg'] 
			else 
			status == 'Passed'
			mesg = ENV['mesg'] 
			end		
			Result.get_result(module_name, filename, "#{status}", "#{mesg}", "#{duration}")					
					
	end
end	
Result.result_summary
end


				
				
				 	
