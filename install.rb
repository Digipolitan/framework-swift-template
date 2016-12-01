#!/usr/bin/ruby

def prompt(*args)
    print(*args)
    gets.chomp()
end

def rename_files(pattern, replacement, path = ".", recursive = true)
  if pattern == nil || replacement == nil
    abort "Missing required parameters (pattern, replacement)"
  end
  entries = Dir.entries(path)
  entries.each do |entry|
    replaced = entry
    replaced_path = File.join(path, entry)
    if replaced_path != __FILE__
      if entry.include?(pattern)
        replaced = entry.gsub(pattern, replacement)
        replaced_path = File.join(path, replaced)
        File.rename(File.join(path, entry), replaced_path)
      end
      if recursive && File.directory?(replaced_path) && replaced != "." && replaced != ".."
        rename_files(pattern, replacement, replaced_path, recursive)
      end
    end
  end
end

def write_to_file(path, content = "")
  File.open(path, "w") { |file|
    file.puts(content)
  }
end

def replace_contents_of_files(pattern, replacement, path = ".", recursive = true)
  if pattern == nil || replacement == nil
    abort "Missing required parameters (pattern, replacement)"
  end
  entries = Dir.entries(path)
  entries.each do |entry|
    file_path = File.join(path, entry)
    if file_path != __FILE__
      if recursive && File.directory?(file_path) && entry != "." && entry != ".."
        replace_contents_of_files(pattern, replacement, file_path, recursive)
      elsif File.file?(file_path)
        content = File.read(file_path)
        if content.include?(pattern)
          write_to_file(file_path, content.gsub(pattern, replacement))
        end
      end
    end
  end
end

project = "DGFrameworkTemplate"
print "#{project} setup\n"
replacement = prompt("Write your project name : ")
print "Starting replacement...\n"
rename_files(project, replacement)
replace_contents_of_files(project, replacement)
print "Successfully replace '#{project}' with '#{replacement}'\n\n"
files_to_clear = ["CHANGELOG.md", "CODE_OF_CONDUCT.md", "CONTRIBUTING.md", "LICENSE", "README.md"]
files_to_clear.each { |f|
  print "- #{f}\n"
}
if prompt("Would you like to clear these DIGIPOLITAN files (y/n)") == "y"
  files_to_clear.each { |f|
    write_to_file(f)
  }
end
if prompt("Delete the installer file (y/n)") == "y"
  File.delete(__FILE__)
end
