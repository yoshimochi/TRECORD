module Public::UsersHelper
  def logged_in?
    !current_user.nil?
  end
end
