require "test_helper"

class OrderNotifierMailerTest < ActionMailer::TestCase
  setup do
    @order = orders(:one)
  end
  test "received" do
    mail = OrderNotifierMailer.received(@order)
    assert_equal "Подтверждение заказа", mail.subject
    assert_equal [ @order.email ], mail.to
    assert_equal [ "notifications@example.com" ], mail.from
    assert_match "Вы заказали", mail.html_part.body.to_s
  end

  # test "shipped" do
  #   mail = OrderNotifierMailer.shipped
  #   assert_equal "Shipped", mail.subject
  #   assert_equal [ "to@example.org" ], mail.to
  #   assert_equal [ "from@example.com" ], mail.from
  #   assert_match "Hi", mail.body.encoded
  # end
end
