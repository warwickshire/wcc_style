require 'jquery-rails'
require 'bootstrap-sass'

module WccStyle
  class Engine < ::Rails::Engine
  
    isolate_namespace WccStyle
  
    initializer 'wcc_style.action_controller' do |app|
      ActiveSupport.on_load :action_controller do      
        helper WccStyle::ApplicationHelper
      end
    end
    
    initializer :assets do |config|
      Rails.application.config.assets.precompile += %w[html5.js *.png]
    end
  
  end
end
