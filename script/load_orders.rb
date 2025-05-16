Order.transaction do
  (1..100).each do |i|
    Order.create(name: "Customer #{i}", address: "Address #{i}", email: "customer#{i}@gmail.com", pay_type: "Дебетовая карта")
  end
end
