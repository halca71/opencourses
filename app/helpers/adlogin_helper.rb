module AdloginHelper

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end

  def adlogged_in?
    !!current_admin
  end

end
