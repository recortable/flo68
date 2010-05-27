# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(title)
    content_for(:title) { title }
    title
  end

  def view_section_path(section)
    {:controller => 'pages', :action => 'section', :id => section.name}
  end

  def markup(text)
    markdown = RDiscount.new(text)
    markdown.to_html
  end
end
