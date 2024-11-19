class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  
  # Usa el método authenticate_user! de Devise
  before_action :authenticate_user!

  # Devise proporciona el método current_user automáticamente, así que no necesitas definirlo aquí
end
