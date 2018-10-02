module ApplicationHelper
	def sortable(column, title = nil)
		title ||= column.titleize
		direction = column == params[:sort] && params[:direction] == "asc" ? "desc" : "asc"
		if params[:search]
			link_to title, :search => params[:search], :sort => column, :direction => direction
		else
			link_to title, :sort => column, :direction => direction
		end
	end
end
