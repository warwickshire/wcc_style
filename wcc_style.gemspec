$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "wcc_style/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wcc_style"
  s.version     = WccStyle::VERSION
  s.authors     = ["Chris Jones"]
  s.email       = ["chrisjones@warwickshire.gov.uk"]
  s.homepage    = "https://git.warwickshire.gov.uk/wcc-styling/wcc_style"
  s.summary     = "WccStyle engine applies WCC Styles to an application"
  s.description = "Apply bootstrap 3 WCC Styles to host application.  Includes default WCC black bar and application sub navigation."

  s.files = Dir["{app,config,db,lib,vendor}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  
  # Use SCSS for stylesheets
  # bootstrap-sass has a dependency on autoprefixer-rails.
  # autoprefixer-rails added a ruby version 2 dependency in version 6.2.0
  # To ensure the gem is compatible with our older 1.9.3 ruby apps we need to lock autoprefixer to 6.1.1
  # The latest version of bootstrap-sass (3.3.7) does not have a dependency on ruby 2
  s.add_dependency 'sass-rails'
  s.add_dependency "jquery-rails"
  s.add_dependency 'bootstrap-sass'
  s.add_dependency 'autoprefixer-rails', '6.1.1'
  
  # Pagination gem
  s.add_development_dependency 'kaminari'
  
  # Bootstrap pagination formatting gem
  s.add_development_dependency 'bootstrap-kaminari-views'
  
  # Bootstrap daterpicker gem
  s.add_dependency 'bootstrap-datepicker-rails'
  
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'webrick', '1.3.1'
  
  # Pull data from YAML files when seeding
  s.add_development_dependency 'dibber'
end
