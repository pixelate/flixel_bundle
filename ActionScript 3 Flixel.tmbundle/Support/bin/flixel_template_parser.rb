#!/usr/bin/env ruby -wKU

# Returns an colon seperated list of directory names 
# that are commonly used as the root directory for source files.
def common_src_dir_list
	src_dirs = ENV['TM_AS3_USUAL_SRC_DIRS']
	src_dirs = "src:lib:source:test" if src_dirs == nil
	src_dirs
end

common_src_directories = common_src_dir_list.gsub(":","|")
# 
new_file = ENV['TM_NEW_FILE']
new_file_path = new_file.sub(/.*\/(#{common_src_directories})\//,"")
new_file_name = File.basename(new_file)
# 
ENV['TM_CLASS_PATH'] = new_file_path.sub(new_file_name,"").chop.gsub("/",".")
ENV['TM_NEW_FILE_BASENAME'] = new_file_name.sub('.as','')

out_plate = STDIN.read

%x{cat > #{ENV['TM_NEW_FILE']} <<ENDOFTEXT
#{out_plate}
ENDOFTEXT}