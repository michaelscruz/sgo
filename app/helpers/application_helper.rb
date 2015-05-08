module ApplicationHelper
	def nav_link(link_text, link_path)
		class_name = (request.fullpath == link_path) ? 'active' : ''

		content_tag(:li, :class => class_name) do
			link_to(raw(link_text), link_path)
		end
	end

	# Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Institute for Quality Education Scholarship Granting Organization"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to(name, "#", :class => "remove-fields")
  end

  def display_boolean(val)
    val ? "Yes" : "No"
  end
end
