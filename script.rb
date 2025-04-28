#!/usr/bin/env ruby

# Usage:
#   ruby script.rb pdf_path ruby_path
#
# Description:
#   This script merges a PDF file with a Ruby file.
#   The first arguments is the orignal PDF file path,
#   The second argument is the ruby script file path

pdf_path, ruby_path = ARGV

pdf_data = File.binread(pdf_path)
ruby_code = File.read(ruby_path)

File.open("output.pdf", "w") do |f|
  f.puts "#!/usr/bin/env ruby"
  f.puts "=begin"
  f.write(pdf_data)
  f.puts "\n=end\n\n"
  f.puts ruby_code
end

puts "Output saved to output.pdf"
