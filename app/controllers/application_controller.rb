class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_locale
  protect_from_forgery

  def set_locale
    if params[:locale].present?
      session[:locale] = params[:locale]
    elsif session[:locale].present?
      # использовать сохранённый в сессии
    else
      session[:locale] = I18n.default_locale
    end

    I18n.locale = session[:locale]
  end

  private

    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

    def after_sign_in_path_for(resource)
      store_index_path
    end

    def after_sign_out_path_for(resource)
      user_session_path
    end
end
