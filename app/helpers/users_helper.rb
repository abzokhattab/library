module UsersHelper

  def load_users
    @users = policy_scope(User)
    authorize @users
  end

  def load_user
    load_users
    id = permitted_params[:id]
    @user = @users.find(id)
  end

  def authorize_resource
    authorize User
  end

  def permitted_params
    params.permit!
  end

  def post_params(extra_params = [])
    temp = extra_params + []
    return temp
  end

  def update_params
    pars = post_params
    pars.delete(:view_id)
    pars
  end

end

