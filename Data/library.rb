Dir[File.join(File.expand_path('../../', __FILE__),'lib/*.rb')].each {|file| require (file)}
Dir[File.join(File.expand_path('../../', __FILE__),'util/*.rb')].each {|file| require (file)}
require 'pry'
require 'watir-webdriver'