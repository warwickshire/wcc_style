require 'test_helper'

module WccStyle
  class NavigationLinkTest < ActiveSupport::TestCase

    def test_url
      @navigation_link = NavigationLink.new(link_name, url: example_url)
      assert_equal example_url, @navigation_link.url
      assert_equal link_name.to_s, @navigation_link.name
    end

    def test_label
      test_url
      assert_equal link_name.to_s.humanize, @navigation_link.label
    end

    def test_label_with_label_in_initiation_data
      @navigation_link = NavigationLink.new(
        link_name,
        url: example_url,
        label: label
      )
      assert_equal label, @navigation_link.label
    end

    def test_link
      test_url
      assert_link_is_an_anchor
    end

    def test_with_additional_args
      @navigation_link = NavigationLink.new(
        link_name,
        url: example_url,
        label: label,
        class: classes
      )
      assert_link_is_an_anchor
      assert_match /class=\"#{classes}\"/, @navigation_link.link
    end

    def assert_link_is_an_anchor
      assert_match /\<a.*>#{@navigation_link.label}\<\/a\>/, @navigation_link.link
      assert_match /href=\"#{example_url}\"/, @navigation_link.link
    end

    def label
      'Example Place'
    end

    def link_name
      :foo
    end

    def classes
       'some classes'
    end

  end
end
