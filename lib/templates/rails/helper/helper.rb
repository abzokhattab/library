< % model_name = class_name.split(/v([0-9]+)::/i).last.singularize -%>
module <%= model_name.pluralize %> Helper

< % res = model_name.split("::").last.pluralize.downcase %>

	def load_<%= res %>
#@<%= res %> = @project.try(:configuration).try(:<%= res %>)
@ < %= res %> = policy_scope( < %= model_name %> )
		authorize @<%= res % >
# @<%= res %> = <%= res %>
# unless permitted_params[:user_id].nil?
# 	claimed_user = User.find(permitted_params[:user_id])
# 	authorize claimed_user, :same_user?
# end
end

def load_ < %= res.singularize %>
		load_<%= res % >
  id = permitted_params[:id]
  @ < %= res.singularize %> = @ < %= res %>.find(id)
	end

	def authorize_resource
		# @project = Project.find(params[:project_id])
  # authorize @project, :update?
  authorize < %= model_name %>
	end
	
	def permitted_params
		params.permit!
	end

	def post_params(extra_params=[])
  temp = extra_params + []
  return temp
end

def update_params
  pars = post_params
  pars.delete(:view_id)
  pars
end

end

