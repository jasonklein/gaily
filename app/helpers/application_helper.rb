module ApplicationHelper

  def active_menu_item(link_path)

    path = Rails.application.routes.recognize_path(link_path)

    controller = path[:controller]

    :active_menu_item if controller == params[:controller]

  end
  
end
