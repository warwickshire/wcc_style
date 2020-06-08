
require 'wcc_style/navigation_link'
require 'wcc_style/navigator'
require "wcc_style/engine"
require 'bootstrap-datepicker-rails'

# require_relative '../app/helpers/wcc_style/application_helper'

module WccStyle

  class << self
    attr_writer :navigation_links

    def navigation_links
      @navigation_links ||= standard_navigation_links
    end

    def navigation_links_type=(option)
      @navigation_links_set = option.to_s
    end

    def navigation_links_type
      @navigation_links_set ||= 'internal'
    end

    def standard_navigation_links
      navigator = Navigator.new(navigation_config[navigation_links_type])
      navigator.list
    end

    def navigation_config_file_path
      File.expand_path('data/navigation_links.yml', File.dirname(__FILE__))
    end

    def navigation_config
      @navigation_config ||= YAML.load_file(navigation_config_file_path)
    end

  end


end
