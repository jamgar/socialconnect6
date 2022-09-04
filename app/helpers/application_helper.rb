module ApplicationHelper
  def show_name(user)
    if user.profile.display_name.blank?
      user.email
    else
     user.profile.display_name
    end 
  end
end
