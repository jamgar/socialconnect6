module AvatarHelper
  require 'digest'
  def avatar(user)
    if user.profile.profile_image.present?    
      image_tag(user.profile.profile_image, class: "inline-block h-10 w-10 rounded-full ring-2 ring-white") 
    else
      content_tag :div, class: "flex items-center h-10 w-10 rounded-full ring-2 ring-white", style: "background-color: ##{background_color(user)}" do
        content_tag(:span, short_name(user), class: "text-white text-2xl font-medium inline-block mx-auto") 
      end
    end
  end

  def short_name(user)
    user.profile.display_name.present? ? user.profile.display_name[0] : "🤖" 
  end

  def background_color(user)
    user.profile.display_name.present? ? Digest::MD5.hexdigest(user.profile.display_name)[0..5] : '6366F1' 
  end
end