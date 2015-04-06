module ApplicationHelper
	def nav_link(link_text, link_path)
		class_name = (request.fullpath == link_path) ? 'active' : ''

		content_tag(:li, :class => class_name) do
			link_to(raw(link_text), link_path)
		end
	end
end
