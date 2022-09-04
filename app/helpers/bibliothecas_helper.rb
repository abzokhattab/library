module BibliothecasHelper

  def load_bibliothecas
    @bibliothecas = policy_scope(Bibliotheca)
    authorize @bibliothecas
  end

  def load_bibliotheca
    load_bibliothecas
    id = permitted_params[:id]
    @bibliotheca = @bibliothecas.find(id)
  end

  def authorize_resource
    authorize Bibliotheca
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

