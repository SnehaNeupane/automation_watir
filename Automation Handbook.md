
The purpose of this Document is to serve as Automation Handbook and instruction/ prerequisites to be followed while using Cloudfactory Automation Framework for Testing.

Contents 
1: Framework
2: how to run a test script

1. Framework: 
					CF Automation Framwork for Testing. This Automation framework for Cloudfactory uses Watir Webdriver , chrome driver and works best with ruby 1.9.3. Test Scripts are written to run  on Chrome Browser only, Please install Watir-webdriver, chrome driver and ruby 1.9.3.

	Automation => This folder/directory contains all the neccesarry subfolder/directories that constitutes Cloudfactory Automation Framwork for Testing . This is a live directory, file, folder under this directory are all live file /folder as the requirement keeps in increasing for enhancement and or new test scripts.

			i   : 	Data => This folder contains data . A tester needs to verify the file name/data file name  that is being used in the test script. 

			ii  : 	flow => This folder contains the list of the modules that is planned to executes . A tester needs to select and deselect by using '#' , A tester needs to type '#'
							if a particular module is not to be run : in short  a module name which has '#' in front of it  denotes it is not selected to run , A module which does not have '#'
							is selected to run /execute.

			iii : 	lib => lib folder has assertions and browser. assertions file has the methods/functions to assert values , browser  file holds all the reusable components , 				 						which is used to write the test scripts .  

			iv  : 	main_folder =>This is the main engine of the framework which binds all the files and folders necessary for test scripts to run . This file gathers necessary data 							filters test script name to execute , creates a log ,  creates a result file. 

			v   :  	Module => Module holds all the module name that is being listed in the flow . A file inside the Module holds all the test script name , Agaion the same logic holds true 			 	 of if '# ' is put in front of the test script name , that particular test script is not run , and if '# ' is not present , a tester chose to run that test script. 

			vi : 	  test_scripts : This is the repository for all the test scripts written . if the test script is not present in this folder and the name is present in above module error 				is thrown.
		  vii :   Utilities : this folder/directory holds log, results, util. log file holds the logic to write/logs in the file , result holds the logic to write the results in a file 					and util serves as main supporting file main_folder.
		  vii : 	log.txt ,Resultd.csv and newlog.text : log.txt is the log file generated while test script being run , Resultd.csv is the file which is generated after a particular 						test script is executed . newlog.txt is the extended version of log.txt. 




	2. How to run a test script: 

		  		Please follow below instruction to run the test script.


				Automation Folder needs to be downloaded or pulled into the local system from the git : https://github.com/sprout/automation . Please keep the automation folder in the Desktop(or as updated). Please do gem install "watir-webdriver" and  install chrome driver in /usr/bin		  				

					Pre-requisites : A tester needs to check on the pre-requisites which has to be on the top of the test script. this pre-requisites if any present ,needs to be fulfilled 										 before executing the test script. 

					Data : 		It is pre-assumed that the data in the data file is already set , so that the tester needs not to play around with the file . 
									 	but incase a test requires data manipulation , please update the data in the respective data file inside this folder. 

					flow : 		flow directory has the module name which is to be executed . A tester needs to select(without '#') and de-select(with '#') . Selecting and De-selecting the module 					 indicates a tester is selecting and de-selecting the entire sets of test scripts under that module . if a tester needs to select and de-select in the test script 					  level, please  see module below.
					module:		Module folder has  folder named under the module name which is listed in the flow . Every (module named) folder contains a file named test_script_name.txt which has a list of test scripts name , which is to be executed . de-select(using '#') to exclude from executing the test script and remove '#' in front of the test script name to execute . 

					main_folder: After the above steps , execute the file inside the folder which is main_script.rb . eg ::: ruby main_script.rb.


	








		

















