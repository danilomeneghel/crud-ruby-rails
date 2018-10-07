module ApplicationHelper
	def sortable(column, title = nil)
		title ||= column.titleize
		direction = column == params[:sort] && params[:direction] == "asc" ? "desc" : "asc"
		icon = sort_direction == "asc" ? "fa fa-sort-asc" : "fa fa-sort-desc"
		icon = column == sort_column ? icon : ""
		if params[:search]
			link_to "#{title} <span class='#{icon}'></span>".html_safe, :search => params[:search], :sort => column, :direction => direction
		else
			link_to "#{title} <span class='#{icon}'></span>".html_safe, :sort => column, :direction => direction
		end
	end
end
