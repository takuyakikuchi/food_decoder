module UserHelper
  def user_avatar(user)
    if user.avatar
     cl_image_tag current_user.avatar, height:50, width:50, crop: :fill, gravity: :face, radius: :max, class: "rounded-circle"
    else
      image_tag('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQC4oRRuY4EBwz_neISEZR8Z8lCBC8G5yYCmtAj8Ko0TTAt7xSFi5KHNaDXdg&s=10', class: "rounded-circle" )
    end
  end
end
