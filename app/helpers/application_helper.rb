module ApplicationHelper
  def set_currency(price)
    # if params[:locale] == "ru"
    if I18n.locale == :ru
      price *= 80
    else
      price
    end
  end
end
