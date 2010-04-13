module PagesHelper

  def section(name)
    if name != @section.name
      link_to(name, "/#{name}", :class => name)
    else
      content_tag(:span, "#{name}", :class => name)
    end
  end
end
