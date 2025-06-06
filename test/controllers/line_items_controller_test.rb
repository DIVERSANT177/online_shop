require "test_helper"

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    self.use_transactional_tests = true
    @line_item = line_items(:item_one)
    @test1 = products(:ruby_book)
    @cart1 = carts(:cart_one)
  end

  test "should get index" do
    get line_items_url
    assert_response :success
  end

  test "should get new" do
    get new_line_item_url
    assert_response :success
  end

  test "should create line_item" do
    assert_difference("LineItem.count") do
      # post line_items_url, params: { line_item: { cart_id: @line_item.cart_id, product_id: @line_item.product_id } }

      post line_items_path, params: { product_id: @test1.id }
    end

    # assert_redirected_to line_item_url(LineItem.last)
    assert_redirected_to store_index_path
  end

  test "should show line_item" do
    get line_item_url(@line_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_item_url(@line_item)
    assert_response :success
  end

  test "should update line_item" do
    patch line_item_url(@line_item), params: { line_item: { cart_id: @line_item.cart_id, product_id: @line_item.product_id } }
    assert_redirected_to line_item_url(@line_item)
  end

  test "should destroy line_item" do
    post line_items_path, params: { product_id: @test1.id }
    assert_difference("LineItem.count", -1) do
      delete line_item_url(LineItem.last.id)
    end

    assert_redirected_to store_index_path(locale: I18n.locale)
  end
end
