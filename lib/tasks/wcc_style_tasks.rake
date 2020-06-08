namespace :wcc_style do
  desc "Configures application for wcc_styles"
  task :setup do

    puts ""
    puts "================================================================================"
    puts "=                         WCC_STYLE - SETUP (started)                          ="
    puts "================================================================================"
    puts ""

    backup_folder = Rails.root.join('app','views/wcc_style/layouts')

    # Check for existing backup and abort if any found
    if Dir[backup_folder + 'OLD*'].any?
      puts "Target directory: '" + backup_folder.to_s + "' contains backup files with an 'OLD' prefix."
      puts "The process has been halted to prevent overwriting of these 'OLD' files."
      puts ""
      puts "See the gem readme for more information."
    else
      ################################################################################
      # Backup any existing files in the wcc_style/layouts folder
      ################################################################################
      if Dir.exist?(backup_folder)
        puts "Backing up files in the 'app/views/wcc_style/layouts' folder..."
        puts ""
        
        Dir.foreach(backup_folder) do |item|
          # Ignore the . and .. when doing a DIR which are considered as files
          unless item == '.' or item == '..'
            FileUtils.cp backup_folder + item, backup_folder + ("OLD" + item)
            puts "  " +  item + " > " + "OLD" + item
           end
        end
        
        # Output empty line (for formatting output to user)
        puts ""

        # Set option post message
        puts "Please replicate any customisation from the 'OLD' files into the new template files then remove the 'OLD' files."
        puts ""
      else
        puts "No existing WCC styling gem setup found, nothing to backup"
        puts ""
      end

      # Copy views/wcc_style to host application
      source = File.expand_path('../../app/views/wcc_style', File.dirname(__FILE__))
      target = Rails.root.join('app','views')
      FileUtils.cp_r(source,target)
      puts "Copied views/wcc_style to host application"

      # Put post completion message...
      puts ""
      puts "See the gem readme for more information."
    end

    puts ""
    puts "================================================================================"
    puts "=                         WCC_STYLE - SETUP (complete)                         ="
    puts "================================================================================"
    puts ""
  end
end