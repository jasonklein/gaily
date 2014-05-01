module UsersHelper

  def true_if_admin
    true if current_user && current_user.role?(:admin) && current_user.id != @user.id
  end

  def true_unless_admin
    (current_user && current_user.role?(:admin)) ? false : true
  end

  def get_image(user)
    if user.image.blank?
      image_tag "default.jpg"
    else
      image_tag user.image.url(:main)
    end
  end

  def get_image_thumb(user)
    if user.image.blank?
      image_tag "default_thumb.jpeg"
    else
      image_tag user.image.url(:thumb)
    end
  end

end
