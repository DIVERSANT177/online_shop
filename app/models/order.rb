class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :user, optional: true

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def email_domain_format
    return if email.blank?

    # Получаем доменную часть
    domain = email.split("@").last

    # Проверяем, что домен содержит как минимум две части, разделённые точкой
    unless domain.present? && domain.match?(/\A[^\.]+\.[^\.]+\z/)
      errors.add(:email, "должен содержать корректный домен")
    end
  end

  PAYMENT_TYPES = [ I18n.t("order.debit_card"), I18n.t("order.credit_card")  ]

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
  validate :email_domain_format
end
