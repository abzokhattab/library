module Api::V1
  < % name = class_name.split('::').last.pluralize -%>
	class <%= name %> Controller < Api::V1::ApplicationController
  include < %= class_name.split('::').last.pluralize %>Helper
		<% model_name = class_name.split(/v([0-9]+)::/i).last -%>		
		before_action :load_<%= model_name.underscore.pluralize %>, only: :index
  before_action :authorize_resource

  def index
    render 'index'
  end

  def show
    @complete = true
    render 'show'
  end

  def destroy
  end

  def update
    @complete = true
    render :template => "show", status: 200
  end

  def create
    pars = params.permit(post_params)
    @ < %= name.singularize.downcase %> = < %= model_name %>.new(pars)
			@<%= name.singularize.downcase %>.save!
			render :template=> "show", status: 201
  end

  def new
    pars = params.permit(post_params)
    @ < %= name.singularize.downcase %> = < %= model_name %>.new(pars)
			render :template= > "show", status : 201
  end

end
end