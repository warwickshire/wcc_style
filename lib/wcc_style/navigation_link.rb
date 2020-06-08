module WccStyle
  class NavigationLink

    include ActionView::Helpers::UrlHelper

    attr_reader :name, :args

    def initialize(name, args={})
      @name = name.to_s
      @args = ActiveSupport::HashWithIndifferentAccess.new(args)
    end

    def url
      @url ||= args.delete(:url)
    end

    def label
      @label ||= args.delete(:label) || name.humanize
    end

    def link
      link_to label, url, args
    end
  end
end
