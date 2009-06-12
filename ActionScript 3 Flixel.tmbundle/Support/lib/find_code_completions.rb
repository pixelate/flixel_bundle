require "find"

dir = ARGV.shift

if dir.nil?
  puts "Usage: ruby find_code_completions.rb path/to/flixel"
  exit
elsif not File.directory?(dir)
  puts "#{dir} is not a directory."
  exit
end

dir = File.join(dir, "/com/adamatomic/flixel")
keywords = []

Find.find(dir) do |file|
  next unless File.extname(file) == ".as"

  if File.directory?(file)
    p file
  else
    content = File::read(file)
    functions = content.scan(/public function (\w+)\(/).to_a
    members = content.scan(/public var (\w+):/).to_a
    keywords += functions + members
  end
end

keywords.uniq!
keywords.sort!

completions = "{ completions = ("

keywords.each_with_index do |keyword, index| 
  completions += "'#{keyword}'"
  completions += "," unless index+1 == keywords.size
end

completions += "); }"

puts completions