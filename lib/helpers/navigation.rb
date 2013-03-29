require "pry"

module RVM
  module Helpers
    module Navigation
      module SubPageNavigation
        def discover_subpages(item)
          (item.children || []).inject([]) do |a, i|
            a.push({ item: i, title: i.attributes[:title], last_modified: i.mtime, path: i.identifier})
          end
        end
      end

      module PageNavigation
        def page_navigation(content)
          binding.pry
        end
      end

      module SiteNavigation
        NAV_ITEM = %Q{<li><a href="%s">%s</a></li>\n}
        NAV_WRAPPER = <<-STR
          <ul class="nav">
            %s
          </ul>
        STR

        SUBNAV_WRAPPER = <<-STR
          <li class="dropdown">
            <a href="%s" class="dropdown-toggle" data-toggle="dropdown" data-target="#">%s <b class="caret"></b></a>
            <ul class="dropdown-menu">
              %s
            </ul>
          </li>
        STR


        def site_navigation(items, *rejects)
          NAV_WRAPPER % items_list(items, rejects).map do |i|
            build_navitem(i)
          end.join
        end

      private

        def build_subnav(item)
          title = item.attributes[:nav] || item.attributes[:title]
          SUBNAV_WRAPPER % [item.identifier, title, item.children.map do |c|
            NAV_ITEM % [c.identifier, (c.attributes[:nav] || c.attributes[:title])]
          end.join]
        end

        def items_list(items, rejects)
          items.sort_by { |i| i.identifier }.select do |i|
            (!rejects.any? { |n| i.start_with?(n) }) &&
            (i.identifier !~ /^\/assets/) &&
            (i.attributes[:nav] != false) &&
            (i.identifier == "/" || i.parent.identifier == "/")
          end
        end

        def build_navitem(item)
          item.attributes[:dropdown] == true ?
          build_subnav(item) : NAV_ITEM % [item.identifier, (item.attributes[:nav] || item.attributes[:title])]
        end
      end
    end
  end
end
