require "test_helper"

class UserStoriesTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include ApplicationHelper
  # include "helpers/application_helper"
  fixtures :products

  test "buying a product" do
    @admin = users(:admin_user)
    sign_in @admin

    LineItem.delete_all
    Order.delete_all
    ruby_book = products(:ruby_book)

    get "/store/index"
    assert_response :success
    assert_template "index"

    post line_items_path, params: { product_id: ruby_book.id }, xhr: true
    assert_response :success

    get "/orders/new"
    assert_response :success
    assert_template "new"

    post "/orders", params: { order: { name: "Ivan", address: "asd", email: "zxc@mail.ru", pay_type: "Кредитная карта" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_template "index"
    cart = Cart.find(session[:cart_id])
    assert_equal 0, cart.line_items.size

    orders = Order.all
    assert_equal 1, orders.size
    order = orders[0]

    assert_equal "Ivan", order.name
    assert_equal "asd", order.address
    assert_equal "zxc@mail.ru", order.email
    assert_equal "Кредитная карта", order.pay_type

    assert_equal 1, order.line_items.size
    line_item = order.line_items[0]
    assert_equal ruby_book, line_item.product

    mail = ActionMailer::Base.deliveries.last
    assert_equal [ order.email ], mail.to
    assert_equal [ "notifications@example.com" ], mail.from
    assert_equal "Подтверждение заказа", mail.subject
  end
end
