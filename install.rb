# Generated by the asset_copier plugin
# http://github.com/pelargir/asset_copier

require 'rake'
 
begin
  puts "============================================================="
  puts "Attempting to install required files into your application..."
  puts "============================================================="
  RAKE_FILE = File.join(File.dirname(__FILE__), '/tasks/asset_copier.rake')
  load RAKE_FILE
  
  Rake::Task['<%= file_name %>:install'].invoke
  puts "=========================================================="
  puts "Success!"
  puts "=========================================================="
rescue Exception => ex
  puts "FAILED TO INSTALL REQUIRED FILES.  PLEASE RUN rake <%= file_name %>:install."
  puts "EXCEPTION: #{ex}"
end