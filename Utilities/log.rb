
class Log
		attr_accessor :logfile
				def initialize(file_name = nil)
				b_path  = File.join(File.dirname(__FILE__), '..' )
				file_name = "#{b_path}/log.txt" #unless file_name
				self.logfile = file_name
			end

		  def report_module_file_name(module_name, file_name)
		   	file = File.open(self.logfile, 'a')
				puts '#' * 80
				file.puts ('#' * 80) 
				puts  "Module Name:" << module_name <<  "   Test Script Name: " << file_name
				file.puts( "Module Name" << module_name <<  "   Test Script Name: " << file_name )
		  end

			def reporter_event(txt, name = "", msg = "") # deleted default argument 
				file = File.open(self.logfile,'a')
				file.sync = true
				time2 = Time.now
				puts  "#{time2.inspect}"<<" " << txt << " " << name<< " "<<msg
				file.puts("#{time2.inspect}" << " "<< " " << txt << " " << name<< " "<<msg)
			end
end 