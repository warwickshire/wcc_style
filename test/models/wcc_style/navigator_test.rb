require 'test_helper'

module WccStyle
  class NavigatorTest < ActiveSupport::TestCase
    include ActionDispatch::Assertions::TagAssertions

    def test_links
      assert_equal 2, navigator.links.length
      assert_kind_of NavigationLink, navigator.links.first
    end

    def test_list
      response_from navigator.list
      assert_tag 'ul', children: {count: 2, only: {tag: 'li'}}
    end

    def test_list_as_ordered_list
      navigator.config[:outer] = 'ol'
      response_from navigator.list
      assert_tag 'ol', children: {count: 2, only: {tag: 'li'}}
    end

    def test_list_with_class
      navigator.config[:options] = {class: 'foo'}
      response_from navigator.list
      assert_tag 'ul', attributes: {class: 'foo'}
    end

    def test_links_with_sublist
      response_from navigator_with_sublist.list
      assert_tag 'ul', children: {count: 2, only: {tag: 'li'}}
    end

    def test_links_with_sublist_has_sublist
      response_from navigator_with_sublist.links_in_inners.last.to_s
      assert_tag 'ul', children: {count: 1, only: {tag: 'li'}}
    end

    def test_links_with_dropdown
      response_from navigator_with_dropdown.list
      assert_tag 'ul', children: {count: 2, only: {tag: 'li'}}
    end

    def test_links_with_dropdown_has_dropdown
      response_from navigator_with_dropdown.links_in_inners.last.to_s
      assert_tag 'li', children: {count: 2}
      assert_tag 'li', child: {tag: 'a', attributes: {class: 'dropdown-toggle'}}
      assert_tag 'li', child: {tag: 'ul', attributes: {class: 'dropdown-menu'}}
    end

    def navigator
      @navigator ||= Navigator.new(
        links: {
          foo: {url: example_url},
          bar: {url: example_url}
        }
      )
    end

    def navigator_with_sublist
      @navigator ||= Navigator.new(
        links: {
          foo: {url: example_url},
          sublist: {
            links: {bar: {url: example_url}}
          }
        }
      )
    end

    def navigator_with_dropdown
      @navigator ||= Navigator.new(
        links: {
          foo: {url: example_url},
          more: {
            type: :dropdown,
            links: {bar: {url: example_url}}
          }
        }
      )
    end

    # Generates @response object for assert_tag to work on
    def response_from(html)
      @response ||= dummy_response.new(html)
    end

    def dummy_response
      Struct.new(:body) do
        def content_type
          ""
        end
      end
    end
  end
end
