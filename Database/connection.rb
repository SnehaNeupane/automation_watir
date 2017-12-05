# coding: utf-8
class Database
require 'mysql'
require  'csv'


attr_accessor :con
#def connection

def initialize(ip,username,passwor,d_name)
	self.con = Mysql::new(ip,username,password,d_name)
end

def query()
con.query(sql)
end

end


db = Mysql::new('192.168.2.25',"speakertext","u61ayzrsZEZFjgRIMKAbgj3xS","di_sol")
sql = 'select * from users'
x= db.query(sql)
x.each do |record|
puts record
end
db.close

#end####
