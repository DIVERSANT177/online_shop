import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
}

document.querySelectorAll('img').forEach(img => {
  
    img.addEventListener('click', function() {
        
        const productId = this.dataset.productId; 

        fetch('/line_items', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
            },
            body: JSON.stringify({ product_id: productId })
        })
        .then(response => { // Почему-то без этого блока информация в корзине не обновляется динамически
            if (response.redirected) {
                window.location.href = response.url; 
            }
            return response.text();
        })
    });
});
