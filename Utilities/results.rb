
require "csv"
module Result
	b_path  = File.join(File.dirname(__FILE__), '..' )
	CSV.open("#{b_path}/Resultd.csv", "wb") do |csv|
	csv << [ "ModuleName", "TestCaseName","Remarks", "Description", "duration(Seconds)"]
				end

			def self.get_result(module_name, test_script_name,remarks, description,duration)
				b_path  = File.join(File.dirname(__FILE__), '..' )
				CSV.open("#{b_path}/Resultd.csv", "a+") do |csv|
				csv << [ module_name, test_script_name, remarks, description, duration]
						end 
			end

			def self.result_summary
				count=c=b=0 
				a = File.join(File.dirname(__FILE__), '..' )
				file1open = "#{a}/Resultd.csv"
				file = File.open(file1open,'r')
				@TS = file.readlines.size - 1

				file1 = File.open(file1open,'r')
				file1.each_line { |line|
				if line.include?("Passed")
					count +=1		
					end
							}
				count2 = @TS-count
				file3 = File.open(file1open,'r')
				file3.each_line {|line|
					#binding.pry
					c +=1
					if c > 1
					ln = line.split(",")
					b = b+ln[4].to_i
					end	
						}
				file2open = "#{a}/Results_Summary.csv"
				file2 = File.open(file2open,'w')
				file2.puts "##############,#####,#######Test summary#######,#######################,####"
				file2.puts "Total_Scripts,Passed,Failed,Total_Time(Seconds)"
				file2.puts "#{@TS},#{count},#{count2},#{b}"
			end

			end