module UserHelper
  def user_avatar(user)
    if user[:avatar]
      cl_image_tag current_user.avatar, height:50, width:50, crop: :fill, gravity: :face, radius: :max, class: "rounded-circle"
    else
      image_tag 'human.png', height:40, width:40, class: "rounded-circle border border-dark p-1"
    end
  end
end
