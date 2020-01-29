require "bootstrap_helpers/engine"
require "action_view"

module BootstrapHelpers
  def bootstrap_card(opts = {}, &block)
    opts = {
      title: "",
      title_header: 3,
      subtitle_header: 4,
      title_class: "card-title",
      subtitle_class: "card-subtitle mb-2 text-muted",
      text_tag: :div,
      text_class: "card-text"
    }.merge(opts)
      content_tag(:div, class: "card") do
        concat(content_tag(:div, class: "card-body") do
          concat(content_tag("h#{opts[:title_header]}", class: opts[:title_class]) { concat(opts[:title]) })
          concat(content_tag("h#{opts[:subtitle_header]}", class: opts[:subtitle_class]) { concat(opts[:subtitle]) })
          concat(content_tag(opts[:text_tag], class: opts[:text_class]) do
            if block_given?
              block.call
            else
              concat(opts[:text])
            end
          end)
        end)
    end
  end
  def bootstrap_alert(opts = {}, &block)
    opts = {
      class: "primary"
    }.merge(opts)
    content_tag(:div, class: "alert alert-#{opts[:class]}", role: "alert") do
      if block_given?
        block.call
      else
        concat(opts[:text])
      end
    end
  end
  def bootstrap_text(opts = {}, &block)
    opts = {
      class: "primary"
    }.merge(opts)
    content_tag(:p, class: "text text-#{opts[:class]}") do
      if block_given?
        block.call
      else
        concat(opts[:text])
      end
    end
  end

  def bootstrap_table(opts = {}, &block)
    opts = {
      class: "table table-striped"
    }.merge(opts)
    content_tag(:table, class: opts[:class]) do
      concat(content_tag(:thead) do
        concat(content_tag(:tr) do
          opts.fetch(:headers, []).each do |header|
            concat(content_tag(:th) { concat(header) })
          end
        end)
      end)
      concat(content_tag(:tbody) do
        if block_given?
          block.call
        end
        opts.fetch(:rows, []).each do |row|
          concat(content_tag(:tr) do
            row.each do |cell|
              concat(content_tag(:td) { concat(cell) })
            end
          end)
        end
      end)
    end
  end

  def nav_link_class(opts)
    if current_page?(opts)
      cls = "nav-link active"
    else
      cls = "nav-link"
    end
    cls
  end

  def nav_tab_link(text, url)
    link_to(text, url, class: nav_link_class(url))
  end

  def bootstrap_nav_tabs(opts = {}, &block)
    opts = {
      nav_class: "nav nav-tabs",
      nav_item_class: "nav-item"
    }.merge(opts)
    tabs = []
    yield tabs
    content_tag(:ul, class: opts[:nav_class]) do
      tabs.each do |tab|
        concat(content_tag(:li, class: opts[:nav_item_class]) do
          concat(tab)
        end)
      end
    end
  end

  def good_or_bad(boolean)
    if boolean
      "success"
    else
      "danger"
    end
  end
end
