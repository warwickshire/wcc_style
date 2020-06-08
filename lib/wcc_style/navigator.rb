module WccStyle
  class Navigator

    include ActionView::Helpers::TagHelper

    attr_accessor :config

    def initialize(config = {})
      @config = ActiveSupport::HashWithIndifferentAccess.new(config)
    end

    def links
      @links ||= @config[:links].inject([]) do |array, kv|
        name, args = kv

        link = if args.include? :links
          args[:label] ||= name
          sublist = self.class.new(args)
          sublist.list
        else
          NavigationLink.new(name, args)
        end
        
        array << link
      end
    end

    def list
      before_list
      [prepend, main_list].compact.join
    end

    def main_list
      content_tag outer, links_in_inners.join, options, escape
    end

    def links_in_inners
      links.collect do |link|
        inner_content = link.respond_to?(:link) ? link.link : link
        content_tag(inner, inner_content, nil, inner_escape)
      end
    end

    def prepend
      @prepend ||= []
    end

    def before_list
      configure_as_dropdown if config[:type].to_s == 'dropdown'
    end

    def escape
      config.fetch :escape, false
    end

    def inner_escape
      config.fetch :inner_escape, false
    end

    def outer
      config.fetch :outer, 'ul'
    end

    def inner
      config.fetch :inner, 'li'
    end

    def label
      config.fetch :label, 'more'
    end

    def options
      @options ||= config.fetch :options, {}
    end

    def configure_as_dropdown
      options[:class] = [options[:class], 'dropdown-menu'].compact.join(' ')
      prepend << dropdown_link
    end

    def dropdown_link
      "<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">#{label.humanize} <b class=\"caret\"></b></a>"
    end

  end
end
