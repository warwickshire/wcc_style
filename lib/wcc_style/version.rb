module WccStyle
  VERSION = "0.4.7"
end

# History
# =======
#
# 0.4.7   Corrected issue with the backup in lib/tasks/wcc_style_tasks.rake
#         The code would fail in new applications because the application would not have the app/views/wcc_style folder.
#
# 0.4.6   Fixed ruby 2 dependency in styling gem. 
#         The bootstrap-sass gem has a dependency on the the autoprefixer-rails gem.  
#         The autoprefixer-rails gem added a ruby version 2 dependency in version 6.2.0
#         To ensure the gem is compatible with our older 1.9.3 ruby apps we need to lock autoprefixer to 6.1.1
#         The latest version of bootstrap-sass (3.3.7) does not have a dependency on ruby 2
#
# 0.4.5   Added missing links to the views.
#         Changed image inks to point to the static website.
#         Update rake task to backup existing views if they exist.
#
#         WARNING: Will fail with dependency errors if used in a ruby 1.9.3 application.  
#         -------  Version 0.4.6 will fix this.  
#
# 0.4.4   Fixed bug in top-nav/sub-nav mobile dropdowns
#         Corrected image locations in test application
#
# 0.4.3   Removed bootstrap font location as causing javascript error
#
# 0.4.2   Pointed images back to www.warwickshire.gov.uk versions to fix issue on uat
#         Moved gem images to vendor directory
#
# 0.4.1 - Minor change to textbox and dropdown styles
#
# 0.4.0 - Updated warwickshire styles to match latest warwickshire website design
#
# 0.3.4 - Updated sass-rails within gemspec to version ~>5.0.0
#
# 0.3.3 - Updated internal footer application contact details to ICT Service Desk Online
#
# 0.3.2 - Added margin to mobile public facing template.
#         Made black bar static on public facing site.
#         Improved banner display for mobile devices.
#         Update footer with new links.
#
# 0.3.1 - Corrected bug in footer external links.
#         Corrected issue with flash messages being carried over into the next view.
#
# 0.3.0 - Developed external facing header, footer and styles
#
# 0.2.0 - Defines main list of navigation links via a YAML file, thereby making
#         it easier to modify the list for different environments.
#
#         Also ensures bootstrap-datepicker-rails is a dependency as lack of this
#         caused errors.
#
# 0.1.1 - Added schools styling
#
# 0.1.0 - Fixes bug caused by lack of access-colours.js. Ready for beta release.
#
# 0.0.8 - Corrected accessibility link within accessibility dialog box.
#         Fixed black bar height with the inclusion of the accessibility options menu.
#         Corrected site search box and button so they scale correctly when user selects bigger text size.
#
# 0 0.7 - Within black bar added additional accessibility options for text size and colour schemes.
#
# 0.0.6 - Improved mobile sub navigation accessibility and layout.
#         Fixed bug in dummy application layouts view.
#
# 0.0.5 - Bug fixed vendor directory missing within gem.
#
# 0.0.4 - Removed kaminari, boostrap-kaminari-views and boostrap-datepicker-rails gem dependency.
#       - Updated how html5shiv, respond.min and placeholders.min are included within layout, due 
#         to issues in production environment and the asset pipeline.
#       - Resolved issue where glyphicons-halflings fonts are not visible in production. 
#
# 0.0.3 - Updated blackbar styles so they reflect the new wcc standards.
#
# 0.0.2 - Updated primary button colour and focus values for each wcc style template.
#         This means the primary button goes darker when in focus.
#         Other minor css updates.
#
# 0.0.1 - Initial app
# 