
require 'csv'

module Util

	def self.comprehensive_run(path)
		module_name_arr = []
		File.open(path, "r").each_line do |line|
	  	flag = line.include?("#")
	  	module_name_arr << line.strip unless flag
		end
		return module_name_arr
	end

##### Execution Utilities :::::
		
	def self.comprehensive_run_module(module_name)
	
		module_base_path = "../Module/"
		puts module_base_path
		arr_name_mod_text = {}
	 	#mod_to_run << module_name # puts the module name in to mod_to_run as an array
	 	#checks the existence of the folder
	 	dir_look = "#{module_base_path}#{module_name}"
	 	module_path = module_base_path + module_name
	 	val = []
	 	Dir.foreach(module_path) do |entry|	
	 		if(entry != '.' && entry !='..')
		 		flagdir = Dir.exists?(dir_look) 
				if flagdir 
			 		file_path = "#{module_path}/test_script_name.txt" 	
			 		File.read(file_path).each_line do |line|		
						flag = line.include?("#")
					  val << line.strip unless flag
					end
				end	
			end
		end
			arr_name_mod_text[module_name] = val
			arr_name_mod_text		 	#return arr_name_mod_text
		end
		

	def self.comprehensive_test_script(path_test_script, test_script_name)
		collection_test_scripts = []
		path = "#{path_test_script}/#{test_script_name}"
	  	File.exists?(path)
	  	collection_test_scripts << test_script_name
	  	return collection_test_scripts
	end

	def self.data_from_datafile
		file_path_master = './../Data/CFAData.csv'
		server_settings = {}
		csv = CSV.read(file_path_master, headers: true)
		headers = csv.headers
		csv.each do |row|
			setting = {}
			headers.each do |val|
				setting.merge!( { val => row[val] } ) unless val == 'TestCaseDatafor'
			end
			server_settings.merge!({ row['TestCaseDatafor'] => setting  })
		end
		return server_settings
	end

	def self.test_data_csv
		file_path_csv = '/../Data/repos.csv'
	
		server_settings = {}
		csv = CSV.read(file_path_master, headers: true)
		headers = csv.headers
		csv.each do |row|
			setting = {}
			headers.each do |val|
			setting.merge!( { val => row[val] } ) unless val == 'ObjectReposfor '
			end
			server_settings.merge!({ row['ObjectReposfor'] => setting  })
		end			
		return server_settings
	end

	def self.data_from_rbac
		file_path_rbac = '/../Data/DataforRbac.csv'
		server_settings = {}
		csv = CSV.read(file_path_rbac, headers: true)
		headers = csv.headers
		csv.each do |row|
			setting = {}
			headers.each do |val|
				setting.merge!( { val => row[val] } ) unless val == 'Dataforthetestcase'
			end
			server_settings.merge!({ row['Dataforthetestcase'] => setting  })
		end
		return server_settings
	end

	def self.read_data_from_file(file_name)

			#a = File.dirname(__FILE__)"
			a = File.join(File.dirname(__FILE__), '..', 'Data' )
			base_path =  '../automation/Data/'
			#file_path = "#{base_path}#{file_name}.csv"# 'DataforRbac.csv'
			file_path = "#{a}/#{file_name}.csv"# 'DataforRbac.csv'
			server_settings = {}
			csv = CSV.read(file_path, headers: true)
			headers = csv.headers
			csv.each do |row|
				setting = {}
				headers.each do |val|
				
					setting.merge!( { val => row[val] } ) unless val == 'Dataforthetestcase'
				
				end
				server_settings.merge!({ row['Dataforthetestcase'] => setting  })
			end
			
			return server_settings

		end

		def self.chomping_ext(fname)
			fname.chomp('.rb')    # => "abc"
		end
		
	end


##  utilities ends 




















